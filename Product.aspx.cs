using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal;
using PayPal.Api;

namespace J39758_CO5027_ASG1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DropDownList DDLProductQty = (DropDownList)FormView1.FindControl("DropDownList1");
            Label productPrice = (Label)FormView1.FindControl("ProductPriceLabel");
            Label productID = (Label)FormView1.FindControl("ProductImageLabel");
            decimal shippingPackaging_Cost = 20.00m;
            int productPrice12;// = (int) productPrice;
            int.TryParse((string)productPrice.Text, out productPrice12);
            int amountOfProducts = int.Parse(DDLProductQty.SelectedValue);
            decimal subTotal = (amountOfProducts * productPrice12);
            decimal totalAmount = subTotal + shippingPackaging_Cost;

            
            var configure = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(configure).GetAccessToken();
            
            var apiContext = new APIContext(accessToken);

            var productInstock = new Item();
            productInstock.name = "Products";
            productInstock.currency = "SGD";
            productInstock.price = productPrice12.ToString();
            productInstock.sku = productID.Text; 
            productInstock.quantity = amountOfProducts.ToString();



            var transaction_infos = new Details();
            transaction_infos.tax = "0";
            transaction_infos.shipping = shippingPackaging_Cost.ToString();
            transaction_infos.subtotal = subTotal.ToString("0.00");

            var transaction_Amount = new Amount();
            transaction_Amount.currency = "BND";
            transaction_Amount.total = totalAmount.ToString("0.00");
            transaction_Amount.details = transaction_infos;

            var transaction = new Transaction();
            transaction.description = "Transaction Completed,Thank you for your purchase!";
            transaction.invoice_number = Guid.NewGuid().ToString(); 
            transaction.amount = transaction_Amount;
            transaction.item_list = new ItemList
            {
                items = new List<Item> { productInstock }
            };

            var buyer = new Payer();
            buyer.payment_method = "paypal";

            var redirectUrls = new RedirectUrls();
            string strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
            string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");

            redirectUrls.cancel_url = strUrl + "cancel.aspx";
            redirectUrls.return_url = strUrl + "CompletePurchase.aspx";
            try
            {
                var payment = Payment.Create(apiContext, new Payment
                {
                    intent = "sale",
                    payer = buyer,
                    transactions = new List<Transaction> { transaction },
                    redirect_urls = redirectUrls
                });

                Session["paymentId"] = payment.id;

                foreach (var link in payment.links)
                {
                    if (link.rel.ToLower().Trim().Equals("approval_url"))
                    {
                        
                        Response.Redirect(link.href);
                    }
                }



            }
            catch (PaymentsException ex)
            {
                Response.Write(ex.Response);
            }
        }
    }
}