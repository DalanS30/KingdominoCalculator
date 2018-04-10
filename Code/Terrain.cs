namespace KingdominoCalculator
{
    public class Terrain
    {
        public string TerrainType { get; set; }
        public int TileCount { get; set; }
        public int CrownCount { get; set; }
        public int Score { get { return TileCount * CrownCount; } }

        public Terrain(string terrainType)
        {
            TerrainType = terrainType;
            TileCount = 0;
            CrownCount = 0;
        }
    }
}