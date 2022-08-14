<%@ Page Title="صفحه اصلی" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large">آخرین اخبار</asp:Label></center>
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="150px" ImageAlign="Top" 
                ImageUrl='<%# Eval("news_img","~/Upload/{0}") %>' Width="150px" />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("news_title") %>'></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("news_description") %>'></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl='<%# Eval("news_id","MoreNews.aspx?id={0}") %>'>MORE.......</asp:HyperLink>
            <br />
            <br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [news_id],[news_img], [news_title], [news_description] FROM [news_master]"></asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
.main{
float:left;
padding:0px;
margin:0px;
width:100%;
}
.imges{
float:left;
padding:0px;
margin:0px;
width:100%;
}
.numbers{
float:left;
margin:0px;
padding:0px;
margin-left:60px;
}
.ProductList Li
{
display :inline;
float:left;
margin-left:25px;
margin-bottom:25px;
}
    </style>
<div class="main">

<div class="imges">

<center><h3 style="font-size: xx-large">گالری</h3></center>

<asp:ListView ID="ListView1" runat="server">
<LayoutTemplate>
<ul class="ProductList">

<asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>

</ul>
</LayoutTemplate>
<ItemTemplate>

<center><li><asp:Image ID="Img1" ImageUrl='<%#Eval("Picpath")%>' runat="server"

Height="400px" Width="350px" /><br /><%#Eval("imagename")%></li></center>
</ItemTemplate>
<EmptyItemTemplate>
<div>
Sorry! No Item found found.
</div>
</EmptyItemTemplate>

</asp:ListView>

</div>
<div class="numbers">
<asp:DataPager ID="DataPager1" PageSize="6" PagedControlID="ListView1" runat="server" OnPreRender="DataPager1_PreRender">
<Fields>
<asp:NumericPagerField />
</Fields>
</asp:DataPager>
</div>  
</div>
</asp:Content>
