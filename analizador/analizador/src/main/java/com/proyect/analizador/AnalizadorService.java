package com.proyect.analizador;

import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;


public class AnalizadorService {
     private final StringBuilder resultado = new StringBuilder();

    public String analizarCodigo(String codigo) throws Exception {
        StringReader sr = new StringReader(codigo);
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);

        AnalizadorLexico lexer = new AnalizadorLexico(sr);  
        parser p = new parser(lexer); 

        try {
            p.parse();
        } catch (Exception e) {
            pw.println("Error sintáctico: " + e.getMessage());
        }

        pw.flush();
        return sw.toString();
    }
}
