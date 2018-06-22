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
        private void BindingFormatForExcel(ExcelWorksheet worksheet, List<getThongBaoNopThueResult> listItems)
        {
            // Set default width cho tất cả column
            worksheet.DefaultColWidth = 10;
            // Tự động xuống hàng khi text quá dài
            worksheet.Cells.Style.WrapText = true;
            // Tạo header
            worksheet.Cells[1, 1].Value = "Kỳ thuế";
            worksheet.Cells[1, 2].Value = "Tiền thuế GTGT";
            worksheet.Cells[1, 3].Value = "Tiền thuế TNCN";
            worksheet.Cells[1, 4].Value = "Tiền thuế môn bài";
            worksheet.Cells[1, 5].Value = "Số nợ";
            worksheet.Cells[1, 6].Value = "Tổng cộng";





            // Lấy range vào tạo format cho range đó ở đây là từ A1 tới Q1
            using (var range = worksheet.Cells["A1:P1"])
            {
                // Set PatternType
                range.Style.Fill.PatternType = ExcelFillStyle.DarkGray;
                // Set Màu cho Background
                range.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.White);
                //
                range.Style.Font.Color.SetColor(System.Drawing.Color.Black);
                // Canh giữa cho các text
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                // Set Font cho text  trong Range hiện tại
                range.Style.Font.SetFromFont(new System.Drawing.Font("Arial", 10));
                // Set Border
                range.Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
                // Set màu ch Border
                range.Style.Border.Bottom.Color.SetColor(System.Drawing.Color.Blue);

            }

            // Đỗ dữ liệu từ list vào 
            for (int i = 0; i < listItems.Count; i++)
            {
                var item = listItems[i];
                worksheet.Cells[i + 2, 1].Value = item.KyThue;
                worksheet.Cells[i + 2, 2].Value = item.ThueGTGN;
                worksheet.Cells[i + 2, 3].Value = item.ThueTNCN;
                worksheet.Cells[i + 2, 4].Value = item.ThueMonBai;
                worksheet.Cells[i + 2, 5].Value = (item.SoNo * -1);
                worksheet.Cells[i + 2, 6].Value = item.TongCong;


                //// Format lại color nếu như thỏa điều kiện
                //if (item.TinhTrangNopThue == "0")
                //{
                //    // Ở đây chúng ta sẽ format lại theo dạng fromRow,fromCol,toRow,toCol
                //    using (var range = worksheet.Cells[i + 2, 1, i + 2, 16])
                //    {
                //        // Format text đỏ và đậm
                //        range.Style.Font.Color.SetColor(Color.Red);
                //        range.Style.Font.Bold = true;
                //    }
                //}

            }
            //worksheet.Cells[2, 16, 2, 16].Style.Numberformat.Format = "dd/MM/yyyy";
            // Format lại định dạng xuất ra ở cột Money
            worksheet.Cells[2, 2, listItems.Count + 4, 6].Style.Numberformat.Format = "#,##";
            //  fix lại width của column với minimum width là 15
            worksheet.Cells[1, 1, listItems.Count + 5, 4].AutoFitColumns(15);

            //// Thực hiện tính theo formula trong excel
            // Hàm Sum 
            //worksheet.Cells[listItems.Count + 3, 3].Value = "Total is :";
            //worksheet.Cells[listItems.Count + 3, 4].Formula = "SUM(D2:D" + (listItems.Count + 1) + ")";
            //// Hàm SumIf
            //worksheet.Cells[listItems.Count + 4, 3].Value = "Greater than 20050 :";
            //worksheet.Cells[listItems.Count + 4, 4].Formula = "SUMIF(D2:D" + (listItems.Count + 1) + ",\">20050\")";
            //// Tinh theo %
            //worksheet.Cells[listItems.Count + 5, 3].Value = "Percentatge: ";
            //worksheet.Cells[listItems.Count + 5, 4].Style.Numberformat.Format = "0.00%";
            //// Dòng này có nghĩa là ở column hiện tại lấy với địa chỉ (Row hiện tại - 1)/ (Row hiện tại - 2) Cùng một colum
            //worksheet.Cells[listItems.Count + 5, 4].FormulaR1C1 = "(R[-1]C/R[-2]C)";
        }
        private Stream CreateExcelFile(Stream stream = null)
        {
            string Thang = txtThangNam.Text;
            List<getThongBaoNopThueResult> list = db.getThongBaoNopThue(Thang).ToList();
            using (var excelPackage = new ExcelPackage(stream ?? new MemoryStream()))
            {
                // Tạo author cho file Excel
                excelPackage.Workbook.Properties.Author = "Hanker";
                // Tạo title cho file Excel
                excelPackage.Workbook.Properties.Title = "EPP test background";
                // thêm tí comments vào làm màu 
                excelPackage.Workbook.Properties.Comments = "This is my fucking generated Comments";
                // Add Sheet vào file Excel
                excelPackage.Workbook.Worksheets.Add("First Sheet");
                // Lấy Sheet bạn vừa mới tạo ra để thao tác 
                var workSheet = excelPackage.Workbook.Worksheets[1];
                // Đổ data vào Excel file

                BindingFormatForExcel(workSheet, list);
                excelPackage.Save();
                return excelPackage.Stream;
            }
        }

        public void Export()
        {
            // Gọi lại hàm để tạo file excel
            var stream = CreateExcelFile();
            // Tạo buffer memory strean để hứng file excel
            var buffer = stream as MemoryStream;
            // Đây là content Type dành cho file excel, còn rất nhiều content-type khác nhưng cái này mình thấy okay nhất
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            // Dòng này rất quan trọng, vì chạy trên firefox hay IE thì dòng này sẽ hiện Save As dialog cho người dùng chọn thư mục để lưu
            // File name của Excel này là ExcelDemo
            Response.AddHeader("Content-Disposition", "attachment; filename=DanhSachSoBoThue.xlsx");
            // Lưu file excel của chúng ta như 1 mảng byte để trả về response
            Response.BinaryWrite(buffer.ToArray());
            // Send tất cả ouput bytes về phía clients
            Response.Flush();
            Response.End();
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

        protected void btnExport_Click(object sender, EventArgs e)
        {
            //Export();
            try
            {
                string Thang = txtThangNam.Text;
                List<getThongBaoNopThueResult> list = db.getThongBaoNopThue(Thang).ToList();
                //List<FileInfo> lst = new List<FileInfo>();
                int i = 0;
                foreach (getThongBaoNopThueResult g in list)
                {
                    string filepath = Server.MapPath("~/Template/kb02.dotx");
                    string targetFile = Server.MapPath("~/file/"+ g.hoten+ i + ".docx");
                    FileInfo tf = new FileInfo(targetFile);
                    if (tf.Exists)
                        System.IO.File.Delete(targetFile);
                    Dictionary<string, string> dic = new Dictionary<string, string>();
                    // Xuất các dữ liệu mình chuẩn bị ở Field (ở đây mình lọc lấy dữ liệu ở dạng linq)
                    dic.Add("hoten", g.hoten);
                    dic.Add("masothue", g.masothue);
                    dic.Add("diachi", g.diachiKD);
                    dic.Add("KyThue", g.KyThue.ToString());
                    dic.Add("KyThue2", g.KyThue2.ToString());
                    dic.Add("ThueMonBai", g.ThueMonBai.ToString());
                    dic.Add("ThueGTGN", g.ThueGTGN.ToString());
                    dic.Add("ThueTNCN", g.ThueTNCN.ToString());
                    dic.Add("SoNo", g.SoNo.ToString());
                    dic.Add("TongCong", g.TongCong.ToString());
                    File.Copy(filepath, targetFile, true);
                    using (WordprocessingDocument document = WordprocessingDocument.Open(targetFile, true))
                    {
                        // If your sourceFile is a different type (e.g., .DOTX), you will need to change the target type like so:

                        document.ChangeDocumentType(WordprocessingDocumentType.Document);
                        // Get the MainPart of the document
                        MainDocumentPart mainPart = document.MainDocumentPart;

                        var mergeFields = mainPart.RootElement.Descendants<FieldCode>();
                        foreach (var a in dic)
                        {
                            var mergeFieldName = a.Key;
                            var replacementText = a.Value;
                            ReplaceMergeFieldWithText(mergeFields, mergeFieldName, replacementText);
                        }
                        // Save the document
                        mainPart.Document.Save();

                        System.IO.FileInfo file = new System.IO.FileInfo(targetFile);
                        //lst.Add(file);
                        i++;
                    }
                }
                //what folder to zip - include trailing slash
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

                            //lstLog.Items.Add("zipped: " + fileToZip);
                        }
                    }

                    using (FileStream finalZipFileStream = new FileStream(Server.MapPath("~/file/DanhSachBangKe.zip"), FileMode.Create))
                    {
                        zipMS.Seek(0, SeekOrigin.Begin);
                        zipMS.CopyTo(finalZipFileStream);
                    }
                }
                Response.ContentType = "application/zip";
                Response.AppendHeader("Content-Disposition", "attachment; filename=DanhSachBangKe.zip");
                //Response.TransmitFile(Server.MapPath("~/file/DanhSachBangKe.zip"));
                //Response.End();
                Response.Flush();
                Response.WriteFile(Server.MapPath("~/file/DanhSachBangKe.zip"));

                Response.End();

            }
            catch (Exception mess)
            {
                st.Append("$.notify('" + mess.Message.Replace("\n", "") + "',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }
    }
}