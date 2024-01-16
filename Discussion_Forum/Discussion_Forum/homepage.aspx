<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Discussion_Forum.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="PostRepeater" runat="server">
        <ItemTemplate>
            <div class="card" style="border: solid 1px;border-color: rgb(167, 167, 167); margin: 2% 1%">
                <div class="card-header">
                    Posted By:
                    <asp:Label runat="server" Text='<%# Eval("Username")%>'></asp:Label>
                    <p style="margin: 0">
                        <asp:Label runat="server" Text='<%# Eval("PostDate")%>'></asp:Label>
                    </p>
                    <!-- <asp:Panel ID="adminpanel" runat="server" Visible="true"> -->
                    <% if (Session["role"].ToString()=="admin")
                    {
                    %>
                        <div class="d-flex justify-content-between" style="font-size: x-large">
                            <asp:LinkButton ID="EditLink" OnClick="EditLink_Click" CommandArgument='<%#Eval("Id")%>' style="text-decoration: none; color: black" runat="server">
                                <i class='bx bx-edit-alt'></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteLink" OnClientClick="return confirm('Are you sure you want to delete this post?');" OnClick="DeleteLink_Click" CommandArgument='<%#Eval("Id")%>' style="text-decoration: none; color: rgb(133, 2, 2)" runat="server">
                                <i class='bx bxs-trash'></i>
                            </asp:LinkButton>
                        </div>
                    <% 
                    }
                    %>
                   
                   <!-- </asp:Panel> -->
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        <asp:Label runat="server" Text='<%# Eval("PostTitle")%>'></asp:Label>
                    </h5>
                    <p class="card-content">
                        <asp:Label runat="server" CssClass="card-text" Text='<%# Eval("PostContent")%>'></asp:Label>
                    </p>
                    
                    <div class="btn-group mt-2" role="group" aria-label="Second group">
                        <asp:LinkButton ID="ReplyLink" OnClick="ReplyLink_Click" CommandArgument='<%#Eval("Id")%>' CssClass="btn btn-outline-primary pb-1" runat="server">
                            <i class="bx bx-chat" style="font-size: x-large"></i>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

        </ItemTemplate>
        
    </asp:Repeater>
</asp:Content>
