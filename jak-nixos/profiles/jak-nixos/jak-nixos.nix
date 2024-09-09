#tr Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, lib, inputs, system,... }:

  {
  # Kernel Parameters miniPC
  boot = {
    kernelParams = [ 
    "nowatchdog"
	  "modprobe.blacklist=iTCO_wdt"
 	  ];
  
    initrd = { 
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };
  
    kernelModules = [ ];
    extraModulePackages = [ ];

    # bootloader grub theme
    loader.grub = rec {
      theme = inputs.distro-grub-themes.packages.${system}.nixos-grub-theme;
      splashImage = "${theme}/splash_image.jpg";
    };

    # Kernel 
    #kernelPackages = pkgs.linuxPackages_latest;
  };
  
  networking.hostName = "jak-nixos";
  
  # User account
  users = {
	  users.dwilliams = {
    isNormalUser = true;
    extraGroups = [ 
		  "wheel" 
		  "video" 
		  "input" 
		  "audio"
		]; 
    packages = with pkgs; [		
      	];
  	};

	defaultUserShell = pkgs.zsh;
  };

  environment.shells = with pkgs; [ zsh ];

  # for HP - Mini pc
  environment.systemPackages = with pkgs; [
    discord
    fzf
    #glxinfo
    #krabby
    vscode
    neovim
    neovide
    gcc 
    ripgrep
    ugrep
    btop
    glances 
    bat
    ncdu
    tmux
    zoxide
    nh
    wallust
    yazi
    glances
    bottom
    mission-center
    lazygit
    duf


    #nvtopPackages.intel # requires unstable channel
  ];

  # Additional fonts needed for office stuff
  fonts.packages = with pkgs; [
	  cascadia-code
 	  ];
	
 # powerManagement = {
#	  enable = true;
#	  cpuFreqGovernor = "performance";
#  };
    
  # Zsh configuration
  programs.zsh = {
    enable = true;
	  enableCompletion = true;
      ohMyZsh = {
        enable = true;
        plugins = ["git"];
        theme = "xiong-chiamiov-plus";
      	};
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = ''
      source <(fzf --zsh);
	    HISTFILE=~/.zsh_history;
	    HISTSIZE=10000;
	    SAVEHIST=10000;
	    setopt appendhistory;
    '';
    shellAliases = { 
      sv = "sudo nvim";
      restart = "systemctl reboot";
      rebuild = "nh os switch --hostname=jak-nixos ";
      update = "nh os switch --hostname=jak-nixos -u";
      gcCleanup = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot"; 
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      poweroff="systemctl poweroff";
      ".." = "cd .."; 
      "..." = "cd ../..";
      h = "history | grep ";
      hs = "history | grep ";
      c = "clear";
      gp = "gping -c blue  -b 120 ";
      bat = "bat --style header snip --style changes --style header";
      };


  };
  
  # Enable CUPS to print documents.
  # services.printing.enable = true;
    
  # HARDWARES:
  hardware = {
    bluetooth = {
	    enable = false;
	    powerOnBoot = false;
	    settings = {
		  General = {
		    Enable = "Source,Sink,Media,Socket";
		    Experimental = true;
			  };
		  };
	  };

	cpu.intel.updateMicrocode = true;

	graphics = {
    	enable = true;
		  extraPackages = with pkgs; [
   			libva
			  libva-utils	
     		];
  	};

  }; 

  services = {
	  blueman.enable = false;
	  xserver.videoDrivers = ["intel"];
	  flatpak.enable = true;
    qemuGuest.enable = true;
  };
  
  # For Electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
}


