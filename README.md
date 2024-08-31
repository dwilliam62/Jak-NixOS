### My Nixos Configs   

-- This was derived from Jak Koolit's NIXOS config.  https://github.com/Jakoolit 
  It's a very simple hyprland config intended to use his Hyprland Dotfiles 
   
  
  My changes: 
     I removed firefox for Google Chrome Added the NIX `nh` util for rebuilds and upgrades 
    Created aliases `rebuild` and `update` using NH. - Added ~/.zshrc-personal for your local aliases and functions
    ~/.zshrc will source that file if found
    

> [!NOTE]
> Home Manager is not used.

#### notes on Jak's Nixos-Hyprland
- GTK themes are install manually. Here is the [`LINK`](https://github.com/JaKooLit/GTK-themes-icons)
- Hyprland-Dots [`LINK`](https://github.com/JaKooLit/Hyprland-Dots)
- Installing of Hyprland-Dots how to [`LINK`](https://github.com/JaKooLit/Hyprland-Dots?tab=readme-ov-file#-copying--installation--update-instructions-)
- Some Notes regarding Hyprland-Dots for Nixos [`LINK`](https://github.com/JaKooLit/Hyprland-Dots?tab=readme-ov-file#-copying--installation--update-instructions-)


> [!NOTE]
> There is not login manager, like SDDM.  This config uses ~/.zprofile for auto start for Hyprland
- ~/.zprofile
```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
       Hyprland 
fi
```
![Jak-screenshot](https://github.com/user-attachments/assets/17b900ed-ba68-4a72-8c39-b5269186f685)

![jak-screenshot2](https://github.com/user-attachments/assets/6872931b-add4-439a-9b0b-88e924e02adf)

![Jak-screenshot3](https://github.com/user-attachments/assets/2de0d3ef-61ed-4d6a-be3c-d8144638cfc0)



 
 
