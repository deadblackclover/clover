;;; clover-buffer.el
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(setq inhibit-startup-message t)

(setq text "
 @@@@@@@  @@@        @@@@@@   @@@  @@@  @@@@@@@@  @@@@@@@   
@@@@@@@@  @@@       @@@@@@@@  @@@  @@@  @@@@@@@@  @@@@@@@@  
!@@       @@!       @@!  @@@  @@!  @@@  @@!       @@!  @@@  
!@!       !@!       !@!  @!@  !@!  @!@  !@!       !@!  @!@  
!@!       @!!       @!@  !@!  @!@  !@!  @!!!:!    @!@!!@!   
!!!       !!!       !@!  !!!  !@!  !!!  !!!!!:    !!@!@!    
:!!       !!:       !!:  !!!  :!:  !!:  !!:       !!: :!!   
:!:        :!:      :!:  !:!   ::!!:!   :!:       :!:  !:!  
 ::: :::   :: ::::  ::::: ::    ::::     :: ::::  ::   :::  
 :: :: :  : :: : :   : :  :      :      : :: ::    :   : :  
                                                            
                                                            
@@@@@@@@  @@@@@@@@@@    @@@@@@    @@@@@@@   @@@@@@          
@@@@@@@@  @@@@@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@          
@@!       @@! @@! @@!  @@!  @@@  !@@       !@@              
!@!       !@! !@! !@!  !@!  @!@  !@!       !@!              
@!!!:!    @!! !!@ @!@  @!@!@!@!  !@!       !!@@!!           
!!!!!:    !@!   ! !@!  !!!@!!!!  !!!        !!@!!!          
!!:       !!:     !!:  !!:  !!!  :!!            !:!         
:!:       :!:     :!:  :!:  !:!  :!:           !:!          
 :: ::::  :::     ::   ::   :::   ::: :::  :::: ::          
: :: ::    :      :     :   : :   :: :: :  :: : :           

[[https://github.com/deadblackclover/emacs.d][Source code]]
[[https://github.com/deadblackclover][DEADBLACKCLOVER]]
[[https://github.com/deadblackclover/emacs.d/blob/master/LICENSE][GNU GPL-3.0]]

")

(switch-to-buffer (get-buffer-create "*clover*"))
(insert text)
(org-mode)
(beginning-of-buffer)

(provide 'clover-buffer)
