// Vérifier si le mode sombre est activé dans les préférences utilisateur ou les cookies
var isDarkMode = localStorage.getItem('darkMode');

// Appliquer le mode sombre ou clair en fonction de la valeur stockée
if (isDarkMode === 'true') {
  document.body.classList.add('dark-mode');
}

// Fonction pour activer le mode sombre
function enableDarkMode() {
  document.body.classList.add('dark-mode');
  localStorage.setItem('darkMode', 'true');
}

// Fonction pour désactiver le mode sombre
function disableDarkMode() {
  document.body.classList.remove('dark-mode');
  localStorage.setItem('darkMode', 'false');
}

// Récupérer le bouton de basculement
var toggleButton = document.getElementById('toggleButton');

// Écouter l'événement de clic sur le bouton
toggleButton.addEventListener('click', function() {
  // Vérifier si le mode sombre est actuellement activé
  if (document.body.classList.contains('dark-mode')) {
    disableDarkMode();
  } else {
    enableDarkMode();
  }
});