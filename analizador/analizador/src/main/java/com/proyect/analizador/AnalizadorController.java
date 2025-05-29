package com.proyect.analizador;

import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java_cup.Lexer;
import java_cup.runtime.ComplexSymbolFactory;

@RestController
@RequestMapping("/analizador")
@CrossOrigin(origins = "http://localhost:3000")

public class AnalizadorController {

     @PostMapping("/analizar")
     public ResponseEntity<String> analizar(@RequestBody String codigo) {
        try {
            // Crear un escritor de salida en memoria
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);

            // Crear el analizador léxico y sintáctico con salida redirigida
            ComplexSymbolFactory sf = new ComplexSymbolFactory();
            Lexer scanner = new Lexer(new StringReader(codigo));
            parser parser = new parser(scanner, sf);

            parser.setWriter(pw); // <- este método lo agregas tú en tu clase parser.java

            parser.parse();

            pw.flush();
            return ResponseEntity.ok(sw.toString());

        } catch (Exception e) {
            return ResponseEntity.ok("Error sintáctico: " + e.getMessage());
        }
    }
}
