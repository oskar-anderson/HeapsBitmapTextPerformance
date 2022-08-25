import h3d.Vector;
import hxd.Res;
import hxd.Rand;
import hxd.App;

class Main extends App {
    var h2dTextBoard = [];
    var frameCount = 0;
    var h2dTextframeCount = null;

    override function init() {
        var font : h2d.Font = hxd.res.DefaultFont.get();

        Res.initEmbed();
        var ps2pFont = hxd.Res.fonts.ps2p_14_text_32bit.toFont();

        h2dTextframeCount = new h2d.Text(ps2pFont, s2d);
        h2dTextframeCount.text = Std.string(frameCount);
        
        var board = getBoard();
        for (y in 0...100) {
            var row = [];
            for (x in 0...100) {
                var text = new h2d.Text(ps2pFont, s2d);
                text.text = board[y][x];
                text.x = x * 14;
                text.y = y * 14 + 14;
                row.push(text);
            }
            h2dTextBoard.push(row);
        }
    }

    override function update(dt:Float) {
        frameCount++;
        h2dTextframeCount.text = Std.string(frameCount);

        var board = getBoard();
        for (y in 0...100) {
            for (x in 0...100) {
                h2dTextBoard[y][x].text = board[y][x];
            }
        }
    }

    static function main() {
        new Main();
    }

    public static function getBoard(): Array<Array<String>> {
        var board:Array<Array<String>> = [for (y in 0...100) [for (x in 0...100) null]];
        var randomPool = "ABCDEFGHIJKLMNOPQRSTUVWabcdefghijklmnopqrstuvw";
        var random = Rand.create();
        for (y in 0...100) {
            for (x in 0...100) {
                var letter = randomPool.charAt(random.random(randomPool.length));
                board[y][x] = letter;
            }
        }
        
        return board;
    }
}