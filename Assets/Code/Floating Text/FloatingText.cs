using UnityEngine;
using System.Collections;

public class FloatingText : MonoBehaviour
{
	// load our Gui skin resource
	private static readonly GUISkin Skin = Resources.Load<GUISkin>("GameSkin");

	public static FloatingText Show(string text, string style, IFloatingTextPositioner positioner)
	{
		var go = new GameObject("Floating Text");
		var floatingText = go.AddComponent<FloatingText>();
		floatingText.Style = Skin.GetStyle(style);
		floatingText._positioner = positioner;
		floatingText._content = new GUIContent(text);
		return floatingText;
	}
	         
	private GUIContent _content;
	private IFloatingTextPositioner _positioner;

	public string Text { get {return _content.text; } set { _content.text = value; } }
	public GUIStyle Style { get; set; }

	public void OnGUI()
	{
		var position = new Vector2();

		// calculate size of content (the text passed into the Show method)
		var contentSize = Style.CalcSize(_content);

		// Get the position that the text is supposed to be displayed at
		// if the positioner returns false, we destroy the object and exit the method
		if (!_positioner.GetPosition(ref position, _content, contentSize))
		{
			Destroy(gameObject);
			return;
		}

		GUI.Label(new Rect(position.x, position.y, contentSize.x, contentSize.y), _content, Style);
	}	

}
