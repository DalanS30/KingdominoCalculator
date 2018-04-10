using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KingdominoCalculator
{
    public partial class Calculator : Page
    {
        public List<Terrain> TerrainList
        {
            get { return Session["TerrainList"] as List<Terrain>; }
            set { Session["TerrainList"] = value; }
        }
        public int? ActiveIndex { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TerrainList = new List<Terrain>();
                TerrainPanel.Visible = false;
            }
        }

        protected void TerrainButton_Click(object sender, ImageClickEventArgs e)
        {
            ActiveIndex = null;
            TerrainList.Add(new Terrain((sender as ImageButton).CommandArgument));
            BindRepeater();
        }

        private void BindRepeater()
        {
            TerrainRepeater.DataSource = TerrainList;
            TerrainIndicatorRepeater.DataSource = TerrainList;
            TerrainRepeater.DataBind();
            TerrainIndicatorRepeater.DataBind();
            CalculateGrandTotal();
            TerrainPanel.Visible = true;
            CalculatorUpdatePanel.Update();
        }

        protected void PlusButton_Click(object sender, EventArgs e)
        {
            ModifyValue((sender as Button).CommandArgument, 1);
        }

        protected void MinusButton_Click(object sender, EventArgs e)
        {
            ModifyValue((sender as Button).CommandArgument, -1);
        }

        private void ModifyValue(string args, int val)
        {
            string[] split = args.Split('|');
            int index = int.Parse(split[0]);
            string type = split[1];
            if (type == "tile")
            {
                int count = TerrainList[index].TileCount + val;
                count = count < 0 ? 0 : count;
                TerrainList[index].TileCount = count;
            }
            else
            {
                int count = TerrainList[index].CrownCount + val;
                count = count < 0 ? 0 : count;
                TerrainList[index].CrownCount = count;
            }
            ActiveIndex = index;
            BindRepeater();
        }

        private void CalculateGrandTotal()
        {
            int score = 0;
            foreach (Terrain t in TerrainList)
            {
                score += t.Score;
            }
            GrandTotalLabel.Text = score.ToString();
        }

        protected string GetActiveString(int index)
        {
            bool active = false;
            if (ActiveIndex != null && index == ActiveIndex)
            {
                active = true;
            }
            else if (ActiveIndex == null && index == TerrainList.Count - 1)
            {
                active = true;
            }
            return active ? "active" : string.Empty;
        }
    }
}