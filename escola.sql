create database escola;
use escola;

-- Criação da tabela dimensão Professor
CREATE TABLE Dim_Professor (
    ID_Professor INT PRIMARY KEY,
    Nome VARCHAR(100),
    Departamento_ID_Departamento INT
);

-- Criação da tabela dimensão Departamento
CREATE TABLE Dim_Departamento (
    ID_Departamento INT PRIMARY KEY,
    Nome_Departamento VARCHAR(100),
    ID_Professor_Coordenador INT
);

-- Criação da tabela dimensão Disciplina
CREATE TABLE Dim_Disciplina (
    ID_Disciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(100),
    Créditos INT
);

-- Criação da tabela dimensão Curso
CREATE TABLE Dim_Curso (
    ID_Curso INT PRIMARY KEY,
    Nome_Curso VARCHAR(100)
);

-- Criação da tabela dimensão Pré-requisitos
CREATE TABLE Dim_PreRequisitos (
    ID_Pre_Requisitos INT PRIMARY KEY,
    Nome_Pre_Requisitos VARCHAR(100)
);

-- Criação da tabela dimensão Aluno
CREATE TABLE Dim_Aluno (
    ID_Aluno INT PRIMARY KEY,
    Nome_Aluno VARCHAR(100)
);

-- Criação da tabela dimensão Data
CREATE TABLE Dim_Data (
    ID_Data_Oferta DATE PRIMARY KEY,
    Data DATE,
    Ano INT,
    Mês INT,
    Dia INT,
    Trimestre VARCHAR(10)
);

-- Criação da tabela fato
CREATE TABLE Fato_Disciplina_Professor (
    ID_Fato INT AUTO_INCREMENT PRIMARY KEY,
    ID_Professor INT,
    ID_Disciplina INT,
    ID_Departamento INT,
    Carga_Horária INT,
    Data_Oferta DATE,
    FOREIGN KEY (ID_Professor) REFERENCES Dim_Professor(ID_Professor),
    FOREIGN KEY (ID_Disciplina) REFERENCES Dim_Disciplina(ID_Disciplina),
    FOREIGN KEY (ID_Departamento) REFERENCES Dim_Departamento(ID_Departamento),
    FOREIGN KEY (Data_Oferta) REFERENCES Dim_Data(ID_Data_Oferta)
);

-- Criação da tabela de relacionamento Disciplina_Curso
CREATE TABLE Disciplina_Curso (
    Disciplina_ID_Disciplina INT,
    Curso_ID_Curso INT,
    PRIMARY KEY (Disciplina_ID_Disciplina, Curso_ID_Curso),
    FOREIGN KEY (Disciplina_ID_Disciplina) REFERENCES Dim_Disciplina(ID_Disciplina),
    FOREIGN KEY (Curso_ID_Curso) REFERENCES Dim_Curso(ID_Curso)
);

-- Criação da tabela de relacionamento Disciplina_Pre_Requisitos
CREATE TABLE Disciplina_Pre_Requisitos (
    Disciplina_ID_Disciplina INT,
    Pre_Requisitos_ID_Pre_Requisitos INT,
    PRIMARY KEY (Disciplina_ID_Disciplina, Pre_Requisitos_ID_Pre_Requisitos),
    FOREIGN KEY (Disciplina_ID_Disciplina) REFERENCES Dim_Disciplina(ID_Disciplina),
    FOREIGN KEY (Pre_Requisitos_ID_Pre_Requisitos) REFERENCES Dim_PreRequisitos(ID_Pre_Requisitos)
);

-- Criação da tabela de relacionamento Matriculado
CREATE TABLE Matriculado (
    Aluno_ID_Aluno INT,
    Disciplina_ID_Disciplina INT,
    PRIMARY KEY (Aluno_ID_Aluno, Disciplina_ID_Disciplina),
    FOREIGN KEY (Aluno_ID_Aluno) REFERENCES Dim_Aluno(ID_Aluno),
    FOREIGN KEY (Disciplina_ID_Disciplina) REFERENCES Dim_Disciplina(ID_Disciplina)
);
