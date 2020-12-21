public class HelloWorldRest {
    static HelloWorldRest self = new HelloWorldRest();
    HelloWorldService helloWorld = new HelloWorldService();

    public static void main(String... args) {
        if (args.length == 0) {
            self.helloWorld.syaHi("you");
        } else {
            for (String arg : args) {
                self.helloWorld.syaHi(arg);
            }
        }
    }
}
