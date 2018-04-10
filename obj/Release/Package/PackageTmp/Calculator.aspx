<%@ Page Title="Calculator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="KingdominoCalculator.Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="CalculatorUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="grand-total-ribbon" class="center ribbon">
                Grand Total:
                <asp:Label ID="GrandTotalLabel" runat="server" Text="0" />
            </div>
            <div id="selector-ribbon" class="center ribbon">
                <div class="row">
                    <div class="col-xs-2">
                        <asp:ImageButton ImageUrl="Images/field.jpg" ID="FieldButton" runat="server" class="img-responsive img-border img-top-banner" CommandArgument="field" OnClick="TerrainButton_Click" />
                    </div>
                    <div class="col-xs-2">
                        <asp:ImageButton ImageUrl="Images/forest.jpg" ID="ForestButton" runat="server" class="img-responsive img-border img-top-banner" CommandArgument="forest" OnClick="TerrainButton_Click" />
                    </div>
                    <div class="col-xs-2">
                        <asp:ImageButton ImageUrl="Images/gold.jpg" ID="GoldButton" runat="server" class="img-responsive img-border img-top-banner" CommandArgument="gold" OnClick="TerrainButton_Click" />
                    </div>
                    <div class="col-xs-2">
                        <asp:ImageButton ImageUrl="Images/grass.jpg" ID="GrassButton" runat="server" class="img-responsive img-border img-top-banner" CommandArgument="grass" OnClick="TerrainButton_Click" />
                    </div>
                    <div class="col-xs-2">
                        <asp:ImageButton ImageUrl="Images/waste.jpg" ID="WasteButton" runat="server" class="img-responsive img-border img-top-banner" CommandArgument="waste" OnClick="TerrainButton_Click" />
                    </div>
                    <div class="col-xs-2">
                        <asp:ImageButton ImageUrl="Images/Water.jpg" ID="waterButton" runat="server" class="img-responsive img-border img-top-banner" CommandArgument="water" OnClick="TerrainButton_Click" />
                    </div>
                </div>
            </div>
            <asp:Panel ID="TerrainPanel" runat="server">
                <div class="content">
                    <div id="carousel-div" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <asp:Repeater ID="TerrainIndicatorRepeater" runat="server">
                                <ItemTemplate>
                                    <li data-target="#carousel-div" data-slide-to='<%# Container.ItemIndex %>' class='<%# GetActiveString(Container.ItemIndex) %>'></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ol>
                        <div class="carousel-inner">
                            <asp:Repeater ID="TerrainRepeater" runat="server">
                                <ItemTemplate>
                                    <div class='<%# "item " + GetActiveString(Container.ItemIndex) %>'>
                                        <div class="terrain-tile" id='<%# string.Format("tile-{0}-{1}", Container.ItemIndex, (Container.DataItem as KingdominoCalculator.Terrain).TerrainType) %>'>
                                            <div class="col-xs-1"></div>
                                            <div class="col-xs-10 terrain-group">
                                                <div class="row">
                                                    <div class="col-xs-4 center">
                                                        Score
                                                        <br />
                                                        <%# (Container.DataItem as KingdominoCalculator.Terrain).Score %>
                                                    </div>
                                                    <div class="col-xs-8">
                                                        <img src='<%# string.Format("Images/{0}.jpg", (Container.DataItem as KingdominoCalculator.Terrain).TerrainType) %>'
                                                            alt='<%# (Container.DataItem as KingdominoCalculator.Terrain).TerrainType %>' class="img-responsive img-border" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 center">
                                                        <div class="row">
                                                            <div class="col-xs-4">
                                                                Tiles
                                                                <br />
                                                                <%# (Container.DataItem as KingdominoCalculator.Terrain).TileCount %>
                                                            </div>
                                                            <div class="col-xs-8">
                                                                <div class="btn-group-vertical" role="group">
                                                                    <asp:Button Text="+" runat="server" class="btn btn-calc btn-plus center" OnClick="PlusButton_Click"
                                                                        CommandArgument='<%# string.Format("{0}|{1}", Container.ItemIndex, "tile") %>' />
                                                                    <asp:Button Text="–" runat="server" class="btn btn-calc btn-minus center" OnClick="MinusButton_Click"
                                                                        CommandArgument='<%# string.Format("{0}|{1}", Container.ItemIndex, "tile") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 center">
                                                        <div class="row">
                                                            <div class="col-xs-4">
                                                                Crowns
                                                                <br />
                                                                <%# (Container.DataItem as KingdominoCalculator.Terrain).CrownCount %>
                                                            </div>
                                                            <div class="col-xs-8">
                                                                <div class="btn-group-vertical" role="group">
                                                                    <asp:Button Text="+" runat="server" class="btn btn-calc btn-plus center" OnClick="PlusButton_Click"
                                                                        CommandArgument='<%# string.Format("{0}|{1}", Container.ItemIndex, "crowns") %>' />
                                                                    <asp:Button Text="–" runat="server" class="btn btn-calc btn-minus center" OnClick="MinusButton_Click"
                                                                        CommandArgument='<%# string.Format("{0}|{1}", Container.ItemIndex, "crowns") %>' />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-1"></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <a class="left carousel-control" href="#carousel-div" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-div" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
