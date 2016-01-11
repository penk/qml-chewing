#include <QApplication>
#include <QQuickView>
#include <QQmlContext>
#include <QX11Info>
#include <QTextCodec>

#include <chewing/chewing.h>
#include <chewing/global.h>
#include <chewing/chewingio.h>

#include <fakekey/fakekey.h>
#undef Bool

class ApplicationData : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE bool sendKey(const QString &msg) {

    if(msg.startsWith(":enter")){
        fakekey_press_keysym(fakekey, XK_Return, 0);
        fakekey_release(fakekey);
        return 0;
    }

    if(msg.startsWith(":backspace")){
        fakekey_press_keysym(fakekey, XK_BackSpace, 0);
        fakekey_release(fakekey);
        return 0;
    }

    QByteArray buf = msg.toUtf8();
    fakekey_press(fakekey, (unsigned char *)(buf.constData()), buf.length(), 0);
    fakekey_release(fakekey);

    return 0;
    }

    Q_INVOKABLE QString queryChewing(const QString &key) {

        QByteArray array = key.toUtf8();
        char* str;

        // FIXME: figure out how to obtain candidates

        for (int i = 0; i < array.length(); i++){
            char u = array.at(i);
            chewing_handle_Default(ctx, u);
            chewing_cand_Enumerate(ctx);

            if (chewing_cand_TotalChoice(ctx) >0) {
                while (chewing_cand_hasNext(ctx)) {
                    str = chewing_cand_String(ctx);
                }
            } else {
                if (chewing_buffer_Check(ctx)) {
                    str = chewing_buffer_String(ctx);
                }
            }

            if (chewing_commit_Check(ctx)) {
                str = chewing_commit_String(ctx);
            }
        }

        // FIXME: clean up query string
        // chewing_free(str);

        return QString(str);
    }

    FakeKey *fakekey;
    ChewingContext *ctx;

};


int main(int argc, char *argv[]) {

    QTextCodec::setCodecForLocale(QTextCodec::codecForName("UTF-8"));

    QApplication app(argc, argv);
    QQuickView view;
    ApplicationData data;

    data.fakekey = fakekey_init(QX11Info::display());

    chewing_Init("/usr/share/libchewing3/chewing", "/tmp");
    data.ctx = chewing_new();
    chewing_set_maxChiSymbolLen(data.ctx, 16);
    chewing_set_candPerPage(data.ctx, 10);

    view.rootContext()->setContextProperty("Keyboard", &data);
    view.setSource(QUrl::fromLocalFile("main.qml"));
    view.show();

    return app.exec();
}

#include "chewing.moc"
