import 'package:command_runner/command_runner.dart';

const version = '1.0.0';

void main(List<String> arguments) {
  var commandRunner = CommandRunner(
    onOutput: (String output) async{
      await write(output);
    },
    onError: (Object error) async {
      if (error is Error) {
        throw error;
      }
      if (error is Exception) {
        print(error);
      }
      return;
      
    },
  )..addCommand(HelpCommand());
  commandRunner.run(arguments);
}
