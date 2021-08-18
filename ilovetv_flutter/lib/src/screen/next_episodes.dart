import 'package:flutter/material.dart';
import '../shared/constants.dart';

class NextEpisodes extends StatefulWidget {
  const NextEpisodes({Key? key}) : super(key: key);

  @override
  _NextEpisodesState createState() => _NextEpisodesState();
}

class _NextEpisodesState extends State<NextEpisodes> {
  Color _iconColor = COLOR_ICON_NOTWATCHED;
  
  void _iconPressed() {
    setState(() {
      if (_iconColor == COLOR_ICON_NOTWATCHED)
        _iconColor = COLOR_ICON_WATCHED;
      else
        _iconColor = COLOR_ICON_NOTWATCHED;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Card('Loki', 'S01 E05: Nome do episodio', './assets/images/bg_tv/bg_loki.jpg'),
        Card('Avatar: A Lenda de Aang', 'S03 E02: Nome do episodio', './assets/images/bg_tv/bg_avatar.jpg'),
        Card('Loki', 'S01 E05: Nome do episodio', './assets/images/bg_tv/bg_loki.jpg'),
        Card('Avatar: A Lenda de Aang', 'S03 E02: Nome do episodio', './assets/images/bg_tv/bg_avatar.jpg'),
        Card('Loki', 'S01 E05: Nome do episodio', './assets/images/bg_tv/bg_loki.jpg'),
        Card('Avatar: A Lenda de Aang', 'S03 E02: Nome do episodio', './assets/images/bg_tv/bg_avatar.jpg'),
        
                
        //mesma coisa que Card()
        //gambiarra pra conseguir executar a troca de Cor do Icone on Pressed
        Container(
      height: 100,
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('./assets/images/bg_tv/bg_loki.jpg'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Text(
                'Loki',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(-6.0, -6.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                      Shadow(
                        offset: Offset(6.0, 6.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                    ],
                  ),
              ),
              Text(
                'S01 E05: Epic Ep',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(-8.0, -8.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                      Shadow(
                        offset: Offset(8.0, 8.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                    ],
                 ),
                ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: _iconPressed,
              icon: Icon(Icons.remove_red_eye_rounded, color: _iconColor)
          )
        ],
      ))
      ],
    );
  }
}

//dar um nome mais apropriado
Widget Card(String _title, String _ep, String _image) {
  return new Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      padding: EdgeInsets.only(left: 20, top: 20, right: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_image),
            fit: BoxFit.cover
            
          ),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                _title,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(-6.0, -6.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                      Shadow(
                        offset: Offset(6.0, 6.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                    ],
                  ),
                ),
              
              Text(
                _ep,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: <Shadow>[
                      Shadow(
                        offset: Offset(-8.0, -8.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                      Shadow(
                        offset: Offset(8.0, 8.0),
                        blurRadius: 10.0,
                        color: Colors.black
                      ),
                    ],
                 ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.remove_red_eye_rounded, color: COLOR_ICON_NOTWATCHED)
          )
        ],
      ));
}
