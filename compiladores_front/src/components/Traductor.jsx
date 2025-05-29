import React, { useState, useRef } from "react";
import styles from "./traductor.module.css";

const Traductor = () => {
  const [inputText, setInputText] = useState("");
  const [outputText, setOutputText] = useState("");
  const fileInputRef = useRef(null);

  const handleTranslate = () => {
    setOutputText(inputText.toUpperCase());
  };

  const handleFileUpload = (e) => {
    const file = e.target.files[0];
    if (file && file.type === "text/plain") {
      const reader = new FileReader();
      reader.onload = (e) => setInputText(e.target.result);
      reader.readAsText(file);
    } else {
      alert("Solo se permiten archivos .txt");
    }
  };

  const handleClear = () => {
    setInputText("");
    setOutputText("");
    if (fileInputRef.current) {
      fileInputRef.current.value = "";
    }
  };

  return (
    <div className={styles.container}>
      <h1>Simple Script</h1>
      <div className={styles.boxes}>
        <div className={styles.inputBox}>
          <label className={styles.label}>Código fuente</label>
          <textarea
            placeholder="Escribe tu texto aquí..."
            value={inputText}
            onChange={(e) => setInputText(e.target.value)}
          />
          <input
            type="file"
            accept=".txt"
            onChange={handleFileUpload}
            ref={fileInputRef}
          />
        </div>

        <div className={styles.outputBox}>
          <label className={styles.label}>Resultado del análisis</label>
          <textarea value={outputText} readOnly />
        </div>
      </div>

      <button
        className={`${styles.button} ${styles.clearButton}`}
        onClick={handleClear}
      >
        Limpiar
      </button>

      <button className={styles.button} onClick={handleTranslate}>
        Traducir
      </button>
    </div>
  );
};

export default Traductor;
