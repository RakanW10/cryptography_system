// import 'package:rsa_encrypt/rsa_encrypt.dart';
// import 'package:pointycastle/api.dart' as crypto;
// import "package:pointycastle/export.dart";

// class MyRSA {
// //Future to hold our KeyPair
//   late Future<crypto.AsymmetricKeyPair> futureKeyPair;

// //to store the KeyPair once we get data from our future
//   late crypto.AsymmetricKeyPair keyPair;

//   Future getKeyPair() async {
//     var helper = RsaKeyHelper();

//     futureKeyPair = helper.computeRSAKeyPair(helper.getSecureRandom());
//     keyPair = await futureKeyPair;

//     var s = helper.encodePublicKeyToPemPKCS1(keyPair.publicKey as RSAPublicKey);

//     String plaintext = "Rakna is going to univarsity.";

//     String ciphertext = encrypt(plaintext, keyPair.publicKey as RSAPublicKey);
//     print(ciphertext);

//     print(decrypt(ciphertext, keyPair.privateKey as RSAPrivateKey));

    
//   }
// }
