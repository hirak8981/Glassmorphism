// Custom JavaScript for glassmorphism app

// Handle custom messages from server
Shiny.addCustomMessageHandler("updateGlass", function(message) {
  const previewCard = document.getElementById("preview-card");
  if (previewCard) {
    // Apply the new style while preserving existing non-conflicting styles
    const existingStyles = previewCard.style.cssText;
    const nonConflictingStyles = existingStyles
      .split(';')
      .filter(style => {
        const prop = style.split(':')[0].trim();
        return prop && !['backdrop-filter', 'background', 'border'].includes(prop);
      })
      .join(';');

    previewCard.style.cssText = message.style + '; ' + nonConflictingStyles;
  }
});

// Add subtle parallax effect on mouse move
document.addEventListener("DOMContentLoaded", function() {
  const cards = document.querySelectorAll(".glass-card:not(.preview-card)");

  cards.forEach(card => {
    card.addEventListener("mousemove", function(e) {
      const rect = card.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;

      const centerX = rect.width / 2;
      const centerY = rect.height / 2;

      const deltaX = (x - centerX) / centerX;
      const deltaY = (y - centerY) / centerY;

      card.style.transform = `perspective(1000px) rotateX(${deltaY * -5}deg) rotateY(${deltaX * 5}deg) translateY(-10px) scale(1.02)`;
    });

    card.addEventListener("mouseleave", function() {
      card.style.transform = "";
    });
  });

  // Add ripple effect on click
  cards.forEach(card => {
    card.addEventListener("click", function(e) {
      const ripple = document.createElement("span");
      const rect = card.getBoundingClientRect();

      ripple.style.cssText = `
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.5);
        width: 20px;
        height: 20px;
        left: ${e.clientX - rect.left - 10}px;
        top: ${e.clientY - rect.top - 10}px;
        pointer-events: none;
        animation: ripple 0.6s ease-out;
      `;

      card.style.position = "relative";
      card.style.overflow = "hidden";
      card.appendChild(ripple);

      setTimeout(() => ripple.remove(), 600);
    });
  });

  // Add ripple animation
  const style = document.createElement("style");
  style.textContent = `
    @keyframes ripple {
      to {
        transform: scale(20);
        opacity: 0;
      }
    }
  `;
  document.head.appendChild(style);
});

// Console welcome message
console.log("%cGlassmorphism Shiny App", "font-size: 24px; font-weight: bold; color: #4a9eff;");
console.log("%cBuilt with Shiny, bslib, and custom CSS/JS", "font-size: 14px; color: #888;");
console.log("%cModular structure with pacman package management", "font-size: 12px; color: #666;");
