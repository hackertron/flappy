import VPlay 2.0
import QtQuick 2.0

EntityBase {
  id: ground
  entityType: "ground"
  width: sprite.width
  height: sprite.height

  SpriteSequenceVPlay {
    id: sprite
    running: scene.gameState != "gameOver"

    SpriteVPlay {
      frameCount: 2
      frameRate: 4
      frameWidth: 368
      frameHeight: 90
      source: "../assets/land.png"
    }
  }
  BoxCollider {
    anchors.fill: parent
    bodyType: Body.Static
    fixture.onBeginContact: {
      scene.stopGame()
    }
  }
}
