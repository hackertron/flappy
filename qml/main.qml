import VPlay 2.0
import QtQuick 2.0

GameWindow {
  id: gameWindow

  

  activeScene: scene

  
  screenWidth: 320
  screenHeight: 480

  EntityManager {
    id: entityManager
  }

  Scene {
    id: scene
    sceneAlignmentY: "bottom"

    property string gameState: "wait"
    property int score: 0

    function startGame() {
       scene.gameState = "play"
     }

    function stopGame() {
      scene.gameState = "gameOver"
    }
    function reset() {
       scene.gameState = "wait"
       scene.score = 0
       pipe1.x = 400
       pipe1.y = 30+Math.random()*200
       pipe2.x = 640
       pipe2.y = 30+Math.random()*200
       player.x = 160
       player.y = 180
     }


   
    width: 320
    height: 480

    Image {
      id: bg
      source: "../assets/bg.png"
      anchors.horizontalCenter: scene.horizontalCenter
      anchors.bottom: scene.gameWindowAnchorItem.bottom
    }

    Pipe {
      id: pipe1
      x: 400
      y: 30+Math.random()*200
    }
    Pipe {
      id: pipe2
      x: 640
      y: 30+Math.random()*200
    }

    Ground {
      anchors.horizontalCenter: scene.horizontalCenter
      anchors.bottom: scene.gameWindowAnchorItem.bottom
    }
    
    Player{
       id: player
       x: 147
       y: 167
    }
    Text {
      text: scene.score
      color: "white"
      anchors.horizontalCenter: scene.horizontalCenter
      y: 30
      font.pixelSize: 30
    }

    PhysicsWorld {
       debugDrawVisible: false // set this to false to hide the physics overlay
        gravity.y: scene.gameState != "wait" ? 27 : 0 // 9.81 would be earth-like gravity, so this one will be pretty strong
     }

    MouseArea {
       anchors.fill: scene.gameWindowAnchorItem
       onPressed: {
         if(scene.gameState == "wait") {
           scene.startGame()
           player.push()
         } else if(scene.gameState == "play") {
           player.push()
         } else if(scene.gameState == "gameOver") {
           scene.reset()
         }
       }
     }


    
    
  }
}

