FasdUAS 1.101.10   ��   ��    k             l     ��  ��     !/usr/bin/osascript     � 	 	 & ! / u s r / b i n / o s a s c r i p t   
  
 l     ��������  ��  ��        l      ��  ��   {u
For details and documentation:
http://github.com/inkling/Subliminal

Copyright 2013 Inkling Systems, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
     �  � 
 F o r   d e t a i l s   a n d   d o c u m e n t a t i o n : 
 h t t p : / / g i t h u b . c o m / i n k l i n g / S u b l i m i n a l 
 
 C o p y r i g h t   2 0 1 3   I n k l i n g   S y s t e m s ,   I n c . 
 
 L i c e n s e d   u n d e r   t h e   A p a c h e   L i c e n s e ,   V e r s i o n   2 . 0   ( t h e   " L i c e n s e " ) ; 
 y o u   m a y   n o t   u s e   t h i s   f i l e   e x c e p t   i n   c o m p l i a n c e   w i t h   t h e   L i c e n s e . 
 Y o u   m a y   o b t a i n   a   c o p y   o f   t h e   L i c e n s e   a t 
 
 	 h t t p : / / w w w . a p a c h e . o r g / l i c e n s e s / L I C E N S E - 2 . 0 
 
 U n l e s s   r e q u i r e d   b y   a p p l i c a b l e   l a w   o r   a g r e e d   t o   i n   w r i t i n g ,   s o f t w a r e 
 d i s t r i b u t e d   u n d e r   t h e   L i c e n s e   i s   d i s t r i b u t e d   o n   a n   " A S   I S "   B A S I S , 
 W I T H O U T   W A R R A N T I E S   O R   C O N D I T I O N S   O F   A N Y   K I N D ,   e i t h e r   e x p r e s s   o r   i m p l i e d . 
 S e e   t h e   L i c e n s e   f o r   t h e   s p e c i f i c   l a n g u a g e   g o v e r n i n g   p e r m i s s i o n s   a n d 
 l i m i t a t i o n s   u n d e r   t h e   L i c e n s e . 
      l     ��������  ��  ��        l      ��  ��    � �
Checks to ensure that assistive device access is enabled 
so that GUI scripts may run, and returns true if it is, 
no if not.

If the setting is not enabled, the script will direct the user 
to open the Preferences and enable it.
     �  � 
 C h e c k s   t o   e n s u r e   t h a t   a s s i s t i v e   d e v i c e   a c c e s s   i s   e n a b l e d   
 s o   t h a t   G U I   s c r i p t s   m a y   r u n ,   a n d   r e t u r n s   t r u e   i f   i t   i s ,   
 n o   i f   n o t . 
 
 I f   t h e   s e t t i n g   i s   n o t   e n a b l e d ,   t h e   s c r i p t   w i l l   d i r e c t   t h e   u s e r   
 t o   o p e n   t h e   P r e f e r e n c e s   a n d   e n a b l e   i t . 
      l     ��������  ��  ��        l    I ����  O     I    k    H      !   Z    E " #���� " H     $ $ 1    ��
�� 
uien # k    A % %  & ' & I   ������
�� .sysobeepnull��� ��� long��  ��   '  ( ) ( l    * + , * I   �� - .
�� .sysodlogaskr        TEXT - b     / 0 / b     1 2 1 b     3 4 3 m     5 5 � 6 6 8 G U I   S c r i p t i n g   i s   n o t   e n a b l e d 4 o    ��
�� 
ret  2 o    ��
�� 
ret  0 m     7 7 � 8 8: O p e n   S y s t e m   P r e f e r e n c e s   a n d   c h e c k   E n a b l e   A c c e s s   f o r   A s s i s t i v e   D e v i c e s   i n   t h e   A c c e s s i b i l i t y   ( o r   U n i v e r s a l   A c c e s s )   p r e f e r e n c e   p a n e ,   t h e n   r u n   t h i s   s c r i p t   a g a i n . . �� 9��
�� 
disp 9 m    ����  ��   +   "stop" icon    , � : :    " s t o p "   i c o n )  ; < ; Z    > = >���� = =   $ ? @ ? n    " A B A 1     "��
�� 
bhit B 1     ��
�� 
rslt @ m   " # C C � D D  O K > O   ' : E F E k   + 9 G G  H I H I  + 0������
�� .miscactvnull��� ��� null��  ��   I  J�� J r   1 9 K L K 4   1 5�� M
�� 
xppb M m   3 4 N N � O O H c o m . a p p l e . p r e f e r e n c e . u n i v e r s a l a c c e s s L 1   5 8��
�� 
xpcp��   F m   ' ( P P�                                                                                  sprf  alis    z  Mercury SSD                ˇ��H+   �nSystem Preferences.app                                          ���(?�        ����  	                Applications    ˈPI      �(�     �n  0Mercury SSD:Applications: System Preferences.app  .  S y s t e m   P r e f e r e n c e s . a p p    M e r c u r y   S S D  #Applications/System Preferences.app   / ��  ��  ��   <  Q�� Q L   ? A R R m   ? @��
�� boovfals��  ��  ��   !  S�� S L   F H T T m   F G��
�� boovtrue��    m      U U�                                                                                  sevs  alis    �  Mercury SSD                ˇ��H+   ��System Events.app                                               N���        ����  	                CoreServices    ˈPI      � PB     �� �� �p  <Mercury SSD:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    M e r c u r y   S S D  -System/Library/CoreServices/System Events.app   / ��  ��  ��     V�� V l     ��������  ��  ��  ��       �� W X��   W ��
�� .aevtoappnull  �   � **** X �� Y���� Z [��
�� .aevtoappnull  �   � **** Y k     I \ \  ����  ��  ��   Z   [  U���� 5�� 7�������� C P���� N��
�� 
uien
�� .sysobeepnull��� ��� long
�� 
ret 
�� 
disp
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit
�� .miscactvnull��� ��� null
�� 
xppb
�� 
xpcp�� J� F*�, ;*j O��%�%�%�jl O��,�  � *j O*��/*�,FUY hOfY hOeUascr  ��ޭ