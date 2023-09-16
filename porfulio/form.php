

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $name = $_POST['name'];
  $email = $_POST['email'];
  $message = $_POST['message'];
  $destination = 'patriceneussi9@gmail.com';
  
  echo "bonjour";

  // Création du contenu de l'e-mail
  $sujet = 'Nouveau message depuis le formulaire de contact';
  $contenu = "Nom : $name\n";
  $contenu .= "E-mail : $email\n";
  $contenu .= "Message :\n$message\n";
  
  // En-têtes de l'e-mail
  $headers = "From: $name <$email>\r\n";
  $headers .= "Reply-To: $email\r\n";
  
  // Envoi de l'e-mail
  mail($destination, $sujet, $contenu, $headers);
  
  // Réponse JSON pour indiquer le succès de l'envoi
  $response = array('success' => true);
  echo json_encode($response);
}
?>