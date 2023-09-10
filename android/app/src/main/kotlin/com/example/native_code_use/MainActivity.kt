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
                println("Over")
            }else{
                println("Else")
            }
        }

    }

}
