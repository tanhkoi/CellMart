using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.AspNetCore.Identity.UI.Services;
using MimeKit;
using project.Models;

namespace project.Utilitys
{
    public class EmailSender : IEmailSender
    {
        private readonly EmailConfiguration _emailConfig;

        public EmailSender(EmailConfiguration emailConfig)
        {
            _emailConfig = emailConfig;
        }

        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            var emailMessage = new MimeMessage();

            emailMessage.From.Add(new MailboxAddress(_emailConfig.UserName, _emailConfig.From));
            emailMessage.To.Add(new MailboxAddress("", email));
            emailMessage.Subject = subject;
            emailMessage.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = htmlMessage };

            using (var client = new SmtpClient())
            {
                await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, true);
                client.AuthenticationMechanisms.Remove("XOAUTH2");
                await client.AuthenticateAsync(_emailConfig.UserName, _emailConfig.Password);
                await client.SendAsync(emailMessage);
                await client.DisconnectAsync(true);
                client.Dispose();
            }
        }

        //private MimeMessage CreateEmailMessage(Message message)
        //{
        //    var emailMessage = new MimeMessage();
        //    emailMessage.From.Add(new MailboxAddress(_emailConfig.UserName, _emailConfig.From));
        //    emailMessage.To.AddRange(message.To);
        //    emailMessage.Subject = message.Subject;
        //    emailMessage.Body = new TextPart(MimeKit.Text.TextFormat.Text) { Text = message.Content };
        //    return emailMessage;
        //}

        //private async Task SendAsync(MimeMessage mailMessage)
        //{
        //    using (var client = new SmtpClient())
        //    {
        //        try
        //        {
        //            await client.ConnectAsync(_emailConfig.SmtpServer, _emailConfig.Port, true);
        //            client.AuthenticationMechanisms.Remove("XOAUTH2");
        //            await client.AuthenticateAsync(_emailConfig.UserName, _emailConfig.Password);

        //            await client.SendAsync(mailMessage);
        //        }
        //        catch
        //        {
        //            //log an error message or throw an exception, or both.
        //            throw;
        //        }
        //        finally
        //        {
        //            await client.DisconnectAsync(true);
        //            client.Dispose();
        //        }
        //    }
        //}
    }
}
