package com.example

import org.scalacheck.Prop.forAll
import org.scalacheck.Gen

object Playground {
  def main(args: Array[String]): Unit = {
    val intList = Gen.listOf(Gen.choose(0,100))

    val prop =
     forAll(intList)(ns => ns.reverse.reverse == ns) && 
      forAll(intList)(ns => ns.headOption == ns.reverse.lastOption)

    val failingProp = forAll(intList)(ns => ns.reverse == ns)
    failingProp.check()
  }
}
