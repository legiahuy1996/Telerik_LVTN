using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.IO.Compression;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TelerikWebApp1.Model;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using DocumentFormat.OpenXml;
using Telerik.Windows.Zip;
using ICSharpCode.SharpZipLib.Zip;
using System.IO;

namespace TelerikWebApp1
{
    public partial class InKeKhaiNopThue : System.Web.UI.Page
    {
        private List<getThongBaoNopThueResult> list;
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        public InKeKhaiNopThue()
        {
            db = new DataClasses1DataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                DeleteFile();
                if (DateTime.Now.Month < 10)
                {
                    txtThangNam.Text = "0" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
                }
                else
                {
                    txtThangNam.Text = DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
                }
            }
        }
        private void ReplaceMergeFieldWithText(IEnumerable<FieldCode> fields, string mergeFieldName, string replacementText)
        {
            var field = fields
                .Where(f => f.InnerText.Contains(mergeFieldName))
                .FirstOrDefault();

            if (field != null)
            {
                // Get the Run that contains our FieldCode
                // Then get the parent container of this Run
                Run rFldCode = (Run)field.Parent;

                // Get the three (3) other Runs that make up our merge field
                Run rBegin = rFldCode.PreviousSibling<Run>();
                Run rSep = rFldCode.NextSibling<Run>();
                Run rText = rSep.NextSibling<Run>();
                Run rEnd = rText.NextSibling<Run>();

                // Get the Run that holds the Text element for our merge field
                // Get the Text element and replace the text content 
                Text t = rText.GetFirstChild<Text>();
                t.Text = replacementText;

                // Remove all the four (4) Runs for our merge field
                rFldCode.Remove();
                rBegin.Remove();
                rSep.Remove();
                rEnd.Remove();
            }

        }
        protected void DeleteFile()
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/file"));

            foreach (FileInfo file in di.GetFiles())
            {
                file.Delete();
            }
            foreach (DirectoryInfo dir in di.GetDirectories())
            {
                dir.Delete(true);
            }

        }
        protected void CreateFileZip()
        {
            string dirRoot = Server.MapPath("~/file");
            //get a list of files
            string[] filesToZip = Directory.GetFiles(dirRoot, "*.*", SearchOption.AllDirectories);
            using (MemoryStream zipMS = new MemoryStream())
            {
                using (System.IO.Compression.ZipArchive zipArchive = new System.IO.Compression.ZipArchive(zipMS, System.IO.Compression.ZipArchiveMode.Create, true))
                {
                    //loop through files to add
                    foreach (string fileToZip in filesToZip)
                    {
                        //exclude some files? -I don't want to ZIP other .zips in the folder.
                        if (new FileInfo(fileToZip).Extension == ".zip") continue;

                        //exclude some file names maybe?
                        if (fileToZip.Contains("node_modules")) continue;

                        //read the file bytes
                        byte[] fileToZipBytes = System.IO.File.ReadAllBytes(fileToZip);
                        //create the entry - this is the zipped filename
                        //change slashes - now it's VALID
                        System.IO.Compression.ZipArchiveEntry zipFileEntry = zipArchive.CreateEntry(fileToZip.Replace(dirRoot, "").Replace('\\', '/'));
                        //add the file contents
                        using (Stream zipEntryStream = zipFileEntry.Open())
                        using (BinaryWriter zipFileBinary = new BinaryWriter(zipEntryStream))
                        {
                            zipFileBinary.Write(fileToZipBytes);
                        }
                    }
                }
                using (FileStream finalZipFileStream = new FileStream(Server.MapPath("~/file/DanhSachBangKe.zip"), FileMode.Create))
                {
                    zipMS.Seek(0, SeekOrigin.Begin);
                    zipMS.CopyTo(finalZipFileStream);
                }
            }
        }
        protected void FillMergeFieldsOfDocumentAndSaveDoc(string filedocpath, Dictionary<string, string> data)
        {
            using (WordprocessingDocument document = WordprocessingDocument.Open(filedocpath, true))
            {
                document.ChangeDocumentType(WordprocessingDocumentType.Document);
                MainDocumentPart mainPart = document.MainDocumentPart;
                var mergeFields = mainPart.RootElement.Descendants<FieldCode>();
                foreach (var a in data)
                {
                    var mergeFieldName = a.Key;
                    var replacementText = a.Value;
                    ReplaceMergeFieldWithText(mergeFields, mergeFieldName, replacementText);
                }
                mainPart.Document.Save();
            }
        }
        protected Dictionary<string, string> GetDataToFillMergeFields(getThongBaoNopThueResult g)
        {
            Dictionary<string, string> data = new Dictionary<string, string>();
            long thuemonbai = g.ThueMonBai ?? 0;
            long thueGTGT = g.ThueGTGT ?? 0;
            long thueTNCN = g.ThueTNCN ?? 0;
            data.Add("hoten", g.hoten);
            data.Add("masothue", g.masothue);
            data.Add("diachi", g.diachiKD);
            data.Add("KyThue", g.KyThue.ToString());
            data.Add("KyThue2", g.KyThue2.ToString());
            data.Add("ThueMonBai", thuemonbai.ToString("#,##"));
            data.Add("ThueGTGN", thueGTGT.ToString("#,##"));
            data.Add("ThueTNCN", thueTNCN.ToString("#,##"));
            data.Add("TongCong", (thueGTGT+thueTNCN+thuemonbai).ToString("#,##"));
            return data;
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                string Thang = txtThangNam.Text;
                List<getThongBaoNopThueResult> list = db.getThongBaoNopThue(Thang, Session["UserID"].ToString()).ToList();
                int i = 0;
                foreach (getThongBaoNopThueResult g in list)
                {
                    string templatefile = Server.MapPath("~/Template/kb02.dotx");
                    string newfile = Server.MapPath("~/file/" + g.hoten + ".docx");
                    FileInfo tf = new FileInfo(newfile);
                    if (tf.Exists)
                        System.IO.File.Delete(newfile);
                    Dictionary<string, string> data = GetDataToFillMergeFields(g);
                    File.Copy(templatefile, newfile, true);
                    FillMergeFieldsOfDocumentAndSaveDoc(newfile, data);
                    i++;
                }
                try
                {
                    CreateFileZip();
                    Response.ContentType = "application/zip";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=DanhSachBangKe.zip");
                    Response.Flush();
                    Response.WriteFile(Server.MapPath("~/file/DanhSachBangKe.zip"));
                }
                finally
                {
                    Response.Flush();
                    DeleteFile();
                }

            }
            catch (Exception mess)
            {
                st.Append("$.notify('" + mess.Message.Replace("\n", "") + "',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }
    }
}