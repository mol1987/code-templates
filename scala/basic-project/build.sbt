val scalaCheck = "org.scalacheck" %% "scalacheck" % "1.17.0" 

ThisBuild / organization := "com.example"
ThisBuild / scalaVersion := "2.12.18"
ThisBuild / version      := "0.1.0-SNAPSHOT"

lazy val root = (project in file("."))
  .settings(
    name := "playground",
    libraryDependencies += scalaCheck 
  )
