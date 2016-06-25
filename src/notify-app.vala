public class MyApp : Gtk.Application {

    public MyApp () {
        Object (application_id: "notify.app",
        flags: ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        var app_window = new Gtk.ApplicationWindow (this);
        app_window.set_border_width (12);

        var layout = new Gtk.Grid ();

        var button = new Gtk.Button.with_label ("Notify");
        button.clicked.connect (() => {
            var notification = new Notification (_("Hello world"));
            notification.set_body (_("Example notification"));
            var icon = new Gtk.Image.from_icon_name ("dialog-warning", Gtk.IconSize.DIALOG);
            notification.set_icon (icon.gicon);
            this.send_notification ("notify.app", notification);
        });


        layout.add (button);
        app_window.add (layout);
        app_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}