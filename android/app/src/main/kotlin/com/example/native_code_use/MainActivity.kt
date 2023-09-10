package com.example.native_code_use

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"toastChannel")
        channel.setMethodCallHandler { call, result ->

            if(call.method == "showToast"){
                println("Android code")
                Toast.makeText(this,"Toast from native side",Toast.LENGTH_LONG).show()
                result.success("Toast Successful")
                println("Over")
            }else if (call.method == "getData"){
                result.success(data())
            }else{
                println("Else")
            }
        }

    }

    fun data(): String {
        return "10"
    }

}
