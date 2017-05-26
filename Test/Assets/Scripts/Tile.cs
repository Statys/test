using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tile : MonoBehaviour {

    public Vector2 GridPosition = Vector2.zero;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void OnMouseEnter()
    {
        GetComponent<Renderer>().material.color = Color.blue;

        Debug.Log(string.Format("My position is x:{0} y:{1}",GridPosition.x, GridPosition.y));
    }

    void OnMouseExit()
    {
        GetComponent<Renderer>().material.color = Color.white;
    }
}
