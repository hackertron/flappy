import VPlay 2.0
import QtQuick 2.0

EntityBase {

    function push() {
      collider.body.linearVelocity = Qt.point(0,0)
      var localForwardVector = collider.body.toWorldVector(Qt.point(0,-280));
      collider.body.applyLinearImpulse(localForwardVector, collider.body.getWorldCenter());
    }
  id: player
  entityType: "player"
  width: 26
  height: 26

  SpriteSequenceVPlay {
    id: bird
    anchors.centerIn: parent

    // adjust the rotation of the bird depending on its vertical speed
    rotation: collider.linearVelocity.y/10
    running: scene.gameState != "gameOver"


    SpriteVPlay {
      frameCount: 3
      frameRate: 10
      frameWidth: 34
      frameHeight: 24
      source: "../assets/bird.png"
    }
  }

  CircleCollider {
       id: collider
       radius: 13
     }
}
