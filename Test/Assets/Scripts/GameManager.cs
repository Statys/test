using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour {

    public GameObject tilePrefab;
    public GameObject userPlayerPrefab;

    public int MapSizeX = 10;
    public int MapSizeY = 10;
    public int CurrentPlayerIndex = 0;

    List<List<Tile>> map = new List<List<Tile>>();
    List<Player> listPlayers = new List<Player>();

	// Use this for initialization
	void Start () {
        GenerateMap();
        GeneratePlayers();
	}

    private void GeneratePlayers()
    {
        listPlayers.Clear();

        UserPlayer player = ((GameObject)(Instantiate(userPlayerPrefab, new Vector3(- Mathf.Floor(MapSizeX / 2), 1.5f, Mathf.Floor(MapSizeY / 2)), Quaternion.Euler(new Vector3())))).GetComponent<UserPlayer>();

        listPlayers.Add(player);

        player = ((GameObject)(Instantiate(userPlayerPrefab, new Vector3(MapSizeX-1-Mathf.Floor(MapSizeX / 2), 1.5f, -MapSizeY+1 + Mathf.Floor(MapSizeY / 2)), Quaternion.Euler(new Vector3())))).GetComponent<UserPlayer>();

        listPlayers.Add(player);
    }

    private void GenerateMap()
    {
        for (int i = 0; i < MapSizeX; i++)
        {
            List<Tile> row = new List<Tile>();
            for (int j = 0; j < MapSizeY; j++)
            {
                Tile tile = ((GameObject)(Instantiate(tilePrefab, new Vector3(i - Mathf.Floor(MapSizeX/2),0,-j+Mathf.Floor(MapSizeY/2)), Quaternion.Euler(new Vector3())))).GetComponent<Tile>();
                tile.GridPosition = new Vector2(i, j);
                row.Add(tile);
            }
            map.Add(row);
        }
    }

    // Update is called once per frame
    void Update () {
		
	}
}
