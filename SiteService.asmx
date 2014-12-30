<%@ WebService Language="C#" Class="SiteService" %>

using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Data;


using System.Web.Script.Services;
//using JCS.Common;
//using JCS.Data;


[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

[System.Web.Script.Services.ScriptService]
public class SiteService  : System.Web.Services.WebService {

    #region Variables Declaration
    //DBHelper objHelper = new DBHelper();
    //General objGen = new General();

    string strSetDesign = "border-collapse:collapse; font-family:Trebuchet MS; font-size:10pt";
    #endregion
    
    
    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod(MessageName="contact")]
    public void JayaContactUs(ContactUs cont)
    {
        SendReqInfoEmailToAdmin(cont);
        SendReqInfoEmailToSubmitter(cont);    
        
    }

    #region SendReqInfoEmailToSubmitter
    private void SendReqInfoEmailToSubmitter(ContactUs contact)
    {
        StringBuilder htmlString = new StringBuilder();
        htmlString.Append(@"<table border='0' cellpadding='0' cellspacing='0' bordercolor='#111111' width='600px' border='5px' bordercolor='#AE4E7C'
                                    style='" + strSetDesign + @"'>
                                <tr><td style='height:10px'>&nbsp;</td></tr>
                                <tr>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        Dear " + contact.Name + @" 
                                    </td>
                                </tr>
                                <tr>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                       Thank you for contacting us. We will get back to you soon. 
                                    </td>
                                </tr>
                                                                                                
                                <tr><td style='height:10px'>&nbsp;</td></tr>
                                <tr><td style='height:10px'>&nbsp;</td></tr>
                                <tr>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        Regards,
                                    </td>
                                </tr>
                                <tr>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        Team Jaya Softwares
                                    </td>
                                </tr>
                                 <tr><td style='height:30px'>&nbsp;</td></tr>
                                 <tr>
                                <td  style='font-family: Trebuchet MS; font-size: 12px;'>
                                    <b>Disclaimer:</b><br />
                                    This is an auto-generated email in response to the Application form that was submitted
                                    through Jaya Softwares website (<a href='http://jayasoftwares.com'>http://jayasoftwares.com</a>). There has
                                    been no verification and in case for any reason this mail has been misdirected,
                                    please let us know at <a href='mailto:jcs@jayasoftwares.com'>jcs@jayasoftwares.com</a>
                                    and do accept our apologies.
                                </td>
                            </tr>


                            </table>");
        //-------------------------------------------------------------------------
        MailMessage mailmsg = new MailMessage();
        mailmsg.From = new MailAddress("Jaya Softwares <jcs@jayasoftwares.com>");
        

        mailmsg.To.Add(new MailAddress(contact.Email));

        mailmsg.Subject = "Thank you for contacting us";
        mailmsg.Body = htmlString.ToString();
        mailmsg.IsBodyHtml = true;

        SmtpClient client = new SmtpClient();
        client.Send(mailmsg);
        //-------------------------------------------------------------------------           

    }

    #endregion


    #region SendReqInfoEmailToAdmin
    private void SendReqInfoEmailToAdmin(ContactUs Info)
    {      
        StringBuilder htmlString = new StringBuilder();
        htmlString.Append(@"<table border='0' cellpadding='0' cellspacing='0' bordercolor='#111111' width='600px' border='5px' bordercolor='#AE4E7C'
                                    style= '" + strSetDesign + @"'>
                                <tr><td colspan='3' style='height:10px'>&nbsp;</td></tr>
                                <tr>
                                    <td colspan='3' style='font-family: Trebuchet MS; font-size: 13px;'>
                                        An enquiry has been submitted on website with following details:
                                    </td>
                                </tr>
                                <tr>
                                    <td style='width:30%; font-family: Trebuchet MS; font-size: 13px;'>
                                        Name
                                    </td>
                                    <td style='width:5%; font-family: Trebuchet MS; font-size: 13px;'>
                                        :
                                    </td>
                                    <td style='width:65%; font-family: Trebuchet MS; font-size: 13px;'>
                                        " + Info.Name + @"
                                    </td>
                                </tr>
                                <tr>
                                    <td style='width:30%; font-family: Trebuchet MS; font-size: 13px;'>
                                        Email
                                    </td>
                                    <td style='width:5%; font-family: Trebuchet MS; font-size: 13px;'>
                                        :
                                    </td>
                                    <td style='width:65%; font-family: Trebuchet MS; font-size: 13px;'>
                                        " + Info.Email + @"
                                    </td>
                                </tr>
                                <tr>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                       Phone No
                                    </td>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        :
                                    </td>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        " + Info.PhoneNo + @"
                                    </td>
                                </tr>                               
                                <tr valign='top' >
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        Message
                                    </td>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        :
                                    </td>
                                    <td style='font-family: Trebuchet MS; font-size: 13px;'>
                                        " + Info.Message + @"
                                    </td>
                                </tr>
                                
                                <tr><td colspan='3' style='height:10px'>&nbsp;</td></tr>
                            </table>");

        //-------------------------------------------------------------------------
        MailMessage mailmsg = new MailMessage();
        
        mailmsg.From = new MailAddress(Info.Name.ToUpper() + " <" +Info.Email.ToLower() + ">");
        mailmsg.To.Add(new MailAddress("kejriwalshrey@gmail.com"));

        //mailmsg.Bcc.Add(new MailAddress("pgupta@jayasoftwares.com"));            


        //-------------------------------------------------------------------------

        mailmsg.Subject = "Jaya software - Contact Form";
        mailmsg.Body = htmlString.ToString();
        mailmsg.IsBodyHtml = true;

        SmtpClient client = new SmtpClient();
        client.Send(mailmsg);
        //-------------------------------------------------------------------------
    }

    #endregion
    
    
    
    
    
    
    
}

public class ContactUs
{
    public string Name { get; set; }
    public string Email { get; set; }
    public string PhoneNo { get; set; }
    public string Message { get; set; }   
    
}

public class Career
{
    public string Post { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string PhoneNo { get; set;}
    public string City { get; set; }
    public string Remarks { get; set; }
    public string UploadFileName { get; set; }
}