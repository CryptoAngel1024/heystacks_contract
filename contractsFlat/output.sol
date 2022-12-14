/ /   S o u r c e s   f l a t t e n e d   w i t h   h a r d h a t   v 2 . 9 . 1   h t t p s : / / h a r d h a t . o r g   
 / /   S P D X - L i c e n s e - I d e n t i f i e r :   M I T   
 p r a g m a   s o l i d i t y   > = 0 . 8 . 9 ;   
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s / t o k e n / E R C 2 0 / I E R C 2 0 . s o l @ v 4 . 5 . 0 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   ( l a s t   u p d a t e d   v 4 . 5 . 0 )   ( t o k e n / E R C 2 0 / I E R C 2 0 . s o l ) 
 
 
 
 / * * 
   *   @ d e v   I n t e r f a c e   o f   t h e   E R C 2 0   s t a n d a r d   a s   d e f i n e d   i n   t h e   E I P . 
   * / 
 i n t e r f a c e   I E R C 2 0   { 
         / * * 
           *   @ d e v   R e t u r n s   t h e   a m o u n t   o f   t o k e n s   i n   e x i s t e n c e . 
           * / 
         f u n c t i o n   t o t a l S u p p l y ( )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 2 5 6 ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   a m o u n t   o f   t o k e n s   o w n e d   b y   ` a c c o u n t ` . 
           * / 
         f u n c t i o n   b a l a n c e O f ( a d d r e s s   a c c o u n t )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 2 5 6 ) ; 
 
         / * * 
           *   @ d e v   M o v e s   ` a m o u n t `   t o k e n s   f r o m   t h e   c a l l e r ' s   a c c o u n t   t o   ` t o ` . 
           * 
           *   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   w h e t h e r   t h e   o p e r a t i o n   s u c c e e d e d . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t . 
           * / 
         f u n c t i o n   t r a n s f e r ( a d d r e s s   t o ,   u i n t 2 5 6   a m o u n t )   e x t e r n a l   r e t u r n s   ( b o o l ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   r e m a i n i n g   n u m b e r   o f   t o k e n s   t h a t   ` s p e n d e r `   w i l l   b e 
           *   a l l o w e d   t o   s p e n d   o n   b e h a l f   o f   ` o w n e r `   t h r o u g h   { t r a n s f e r F r o m } .   T h i s   i s 
           *   z e r o   b y   d e f a u l t . 
           * 
           *   T h i s   v a l u e   c h a n g e s   w h e n   { a p p r o v e }   o r   { t r a n s f e r F r o m }   a r e   c a l l e d . 
           * / 
         f u n c t i o n   a l l o w a n c e ( a d d r e s s   o w n e r ,   a d d r e s s   s p e n d e r )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 2 5 6 ) ; 
 
         / * * 
           *   @ d e v   S e t s   ` a m o u n t `   a s   t h e   a l l o w a n c e   o f   ` s p e n d e r `   o v e r   t h e   c a l l e r ' s   t o k e n s . 
           * 
           *   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   w h e t h e r   t h e   o p e r a t i o n   s u c c e e d e d . 
           * 
           *   I M P O R T A N T :   B e w a r e   t h a t   c h a n g i n g   a n   a l l o w a n c e   w i t h   t h i s   m e t h o d   b r i n g s   t h e   r i s k 
           *   t h a t   s o m e o n e   m a y   u s e   b o t h   t h e   o l d   a n d   t h e   n e w   a l l o w a n c e   b y   u n f o r t u n a t e 
           *   t r a n s a c t i o n   o r d e r i n g .   O n e   p o s s i b l e   s o l u t i o n   t o   m i t i g a t e   t h i s   r a c e 
           *   c o n d i t i o n   i s   t o   f i r s t   r e d u c e   t h e   s p e n d e r ' s   a l l o w a n c e   t o   0   a n d   s e t   t h e 
           *   d e s i r e d   v a l u e   a f t e r w a r d s : 
           *   h t t p s : / / g i t h u b . c o m / e t h e r e u m / E I P s / i s s u e s / 2 0 # i s s u e c o m m e n t - 2 6 3 5 2 4 7 2 9 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t . 
           * / 
         f u n c t i o n   a p p r o v e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   a m o u n t )   e x t e r n a l   r e t u r n s   ( b o o l ) ; 
 
         / * * 
           *   @ d e v   M o v e s   ` a m o u n t `   t o k e n s   f r o m   ` f r o m `   t o   ` t o `   u s i n g   t h e 
           *   a l l o w a n c e   m e c h a n i s m .   ` a m o u n t `   i s   t h e n   d e d u c t e d   f r o m   t h e   c a l l e r ' s 
           *   a l l o w a n c e . 
           * 
           *   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   w h e t h e r   t h e   o p e r a t i o n   s u c c e e d e d . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t . 
           * / 
         f u n c t i o n   t r a n s f e r F r o m ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   e x t e r n a l   r e t u r n s   ( b o o l ) ; 
 
         / * * 
           *   @ d e v   E m i t t e d   w h e n   ` v a l u e `   t o k e n s   a r e   m o v e d   f r o m   o n e   a c c o u n t   ( ` f r o m ` )   t o 
           *   a n o t h e r   ( ` t o ` ) . 
           * 
           *   N o t e   t h a t   ` v a l u e `   m a y   b e   z e r o . 
           * / 
         e v e n t   T r a n s f e r ( a d d r e s s   i n d e x e d   f r o m ,   a d d r e s s   i n d e x e d   t o ,   u i n t 2 5 6   v a l u e ) ; 
 
         / * * 
           *   @ d e v   E m i t t e d   w h e n   t h e   a l l o w a n c e   o f   a   ` s p e n d e r `   f o r   a n   ` o w n e r `   i s   s e t   b y 
           *   a   c a l l   t o   { a p p r o v e } .   ` v a l u e `   i s   t h e   n e w   a l l o w a n c e . 
           * / 
         e v e n t   A p p r o v a l ( a d d r e s s   i n d e x e d   o w n e r ,   a d d r e s s   i n d e x e d   s p e n d e r ,   u i n t 2 5 6   v a l u e ) ; 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s / t o k e n / E R C 2 0 / e x t e n s i o n s / I E R C 2 0 M e t a d a t a . s o l @ v 4 . 5 . 0 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   v 4 . 4 . 1   ( t o k e n / E R C 2 0 / e x t e n s i o n s / I E R C 2 0 M e t a d a t a . s o l ) 
 
 
 
 / * * 
   *   @ d e v   I n t e r f a c e   f o r   t h e   o p t i o n a l   m e t a d a t a   f u n c t i o n s   f r o m   t h e   E R C 2 0   s t a n d a r d . 
   * 
   *   _ A v a i l a b l e   s i n c e   v 4 . 1 . _ 
   * / 
 i n t e r f a c e   I E R C 2 0 M e t a d a t a   i s   I E R C 2 0   { 
         / * * 
           *   @ d e v   R e t u r n s   t h e   n a m e   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   n a m e ( )   e x t e r n a l   v i e w   r e t u r n s   ( s t r i n g   m e m o r y ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   s y m b o l   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   s y m b o l ( )   e x t e r n a l   v i e w   r e t u r n s   ( s t r i n g   m e m o r y ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   d e c i m a l s   p l a c e s   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   d e c i m a l s ( )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 8 ) ; 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s / u t i l s / C o n t e x t . s o l @ v 4 . 5 . 0 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   v 4 . 4 . 1   ( u t i l s / C o n t e x t . s o l ) 
 
 
 
 / * * 
   *   @ d e v   P r o v i d e s   i n f o r m a t i o n   a b o u t   t h e   c u r r e n t   e x e c u t i o n   c o n t e x t ,   i n c l u d i n g   t h e 
   *   s e n d e r   o f   t h e   t r a n s a c t i o n   a n d   i t s   d a t a .   W h i l e   t h e s e   a r e   g e n e r a l l y   a v a i l a b l e 
   *   v i a   m s g . s e n d e r   a n d   m s g . d a t a ,   t h e y   s h o u l d   n o t   b e   a c c e s s e d   i n   s u c h   a   d i r e c t 
   *   m a n n e r ,   s i n c e   w h e n   d e a l i n g   w i t h   m e t a - t r a n s a c t i o n s   t h e   a c c o u n t   s e n d i n g   a n d 
   *   p a y i n g   f o r   e x e c u t i o n   m a y   n o t   b e   t h e   a c t u a l   s e n d e r   ( a s   f a r   a s   a n   a p p l i c a t i o n 
   *   i s   c o n c e r n e d ) . 
   * 
   *   T h i s   c o n t r a c t   i s   o n l y   r e q u i r e d   f o r   i n t e r m e d i a t e ,   l i b r a r y - l i k e   c o n t r a c t s . 
   * / 
 a b s t r a c t   c o n t r a c t   C o n t e x t   { 
         f u n c t i o n   _ m s g S e n d e r ( )   i n t e r n a l   v i e w   v i r t u a l   r e t u r n s   ( a d d r e s s )   { 
                 r e t u r n   m s g . s e n d e r ; 
         } 
 
         f u n c t i o n   _ m s g D a t a ( )   i n t e r n a l   v i e w   v i r t u a l   r e t u r n s   ( b y t e s   c a l l d a t a )   { 
                 r e t u r n   m s g . d a t a ; 
         } 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s / t o k e n / E R C 2 0 / E R C 2 0 . s o l @ v 4 . 5 . 0 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   ( l a s t   u p d a t e d   v 4 . 5 . 0 )   ( t o k e n / E R C 2 0 / E R C 2 0 . s o l ) 
 
 
 
 
 
 / * * 
   *   @ d e v   I m p l e m e n t a t i o n   o f   t h e   { I E R C 2 0 }   i n t e r f a c e . 
   * 
   *   T h i s   i m p l e m e n t a t i o n   i s   a g n o s t i c   t o   t h e   w a y   t o k e n s   a r e   c r e a t e d .   T h i s   m e a n s 
   *   t h a t   a   s u p p l y   m e c h a n i s m   h a s   t o   b e   a d d e d   i n   a   d e r i v e d   c o n t r a c t   u s i n g   { _ m i n t } . 
   *   F o r   a   g e n e r i c   m e c h a n i s m   s e e   { E R C 2 0 P r e s e t M i n t e r P a u s e r } . 
   * 
   *   T I P :   F o r   a   d e t a i l e d   w r i t e u p   s e e   o u r   g u i d e 
   *   h t t p s : / / f o r u m . z e p p e l i n . s o l u t i o n s / t / h o w - t o - i m p l e m e n t - e r c 2 0 - s u p p l y - m e c h a n i s m s / 2 2 6 [ H o w 
   *   t o   i m p l e m e n t   s u p p l y   m e c h a n i s m s ] . 
   * 
   *   W e   h a v e   f o l l o w e d   g e n e r a l   O p e n Z e p p e l i n   C o n t r a c t s   g u i d e l i n e s :   f u n c t i o n s   r e v e r t 
   *   i n s t e a d   r e t u r n i n g   ` f a l s e `   o n   f a i l u r e .   T h i s   b e h a v i o r   i s   n o n e t h e l e s s 
   *   c o n v e n t i o n a l   a n d   d o e s   n o t   c o n f l i c t   w i t h   t h e   e x p e c t a t i o n s   o f   E R C 2 0 
   *   a p p l i c a t i o n s . 
   * 
   *   A d d i t i o n a l l y ,   a n   { A p p r o v a l }   e v e n t   i s   e m i t t e d   o n   c a l l s   t o   { t r a n s f e r F r o m } . 
   *   T h i s   a l l o w s   a p p l i c a t i o n s   t o   r e c o n s t r u c t   t h e   a l l o w a n c e   f o r   a l l   a c c o u n t s   j u s t 
   *   b y   l i s t e n i n g   t o   s a i d   e v e n t s .   O t h e r   i m p l e m e n t a t i o n s   o f   t h e   E I P   m a y   n o t   e m i t 
   *   t h e s e   e v e n t s ,   a s   i t   i s n ' t   r e q u i r e d   b y   t h e   s p e c i f i c a t i o n . 
   * 
   *   F i n a l l y ,   t h e   n o n - s t a n d a r d   { d e c r e a s e A l l o w a n c e }   a n d   { i n c r e a s e A l l o w a n c e } 
   *   f u n c t i o n s   h a v e   b e e n   a d d e d   t o   m i t i g a t e   t h e   w e l l - k n o w n   i s s u e s   a r o u n d   s e t t i n g 
   *   a l l o w a n c e s .   S e e   { I E R C 2 0 - a p p r o v e } . 
   * / 
 c o n t r a c t   E R C 2 0   i s   C o n t e x t ,   I E R C 2 0 ,   I E R C 2 0 M e t a d a t a   { 
         m a p p i n g ( a d d r e s s   = >   u i n t 2 5 6 )   p r i v a t e   _ b a l a n c e s ; 
 
         m a p p i n g ( a d d r e s s   = >   m a p p i n g ( a d d r e s s   = >   u i n t 2 5 6 ) )   p r i v a t e   _ a l l o w a n c e s ; 
 
         u i n t 2 5 6   p r i v a t e   _ t o t a l S u p p l y ; 
 
         s t r i n g   p r i v a t e   _ n a m e ; 
         s t r i n g   p r i v a t e   _ s y m b o l ; 
 
         / * * 
           *   @ d e v   S e t s   t h e   v a l u e s   f o r   { n a m e }   a n d   { s y m b o l } . 
           * 
           *   T h e   d e f a u l t   v a l u e   o f   { d e c i m a l s }   i s   1 8 .   T o   s e l e c t   a   d i f f e r e n t   v a l u e   f o r 
           *   { d e c i m a l s }   y o u   s h o u l d   o v e r l o a d   i t . 
           * 
           *   A l l   t w o   o f   t h e s e   v a l u e s   a r e   i m m u t a b l e :   t h e y   c a n   o n l y   b e   s e t   o n c e   d u r i n g 
           *   c o n s t r u c t i o n . 
           * / 
         c o n s t r u c t o r ( s t r i n g   m e m o r y   n a m e _ ,   s t r i n g   m e m o r y   s y m b o l _ )   { 
                 _ n a m e   =   n a m e _ ; 
                 _ s y m b o l   =   s y m b o l _ ; 
         } 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   n a m e   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   n a m e ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( s t r i n g   m e m o r y )   { 
                 r e t u r n   _ n a m e ; 
         } 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   s y m b o l   o f   t h e   t o k e n ,   u s u a l l y   a   s h o r t e r   v e r s i o n   o f   t h e 
           *   n a m e . 
           * / 
         f u n c t i o n   s y m b o l ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( s t r i n g   m e m o r y )   { 
                 r e t u r n   _ s y m b o l ; 
         } 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   n u m b e r   o f   d e c i m a l s   u s e d   t o   g e t   i t s   u s e r   r e p r e s e n t a t i o n . 
           *   F o r   e x a m p l e ,   i f   ` d e c i m a l s `   e q u a l s   ` 2 ` ,   a   b a l a n c e   o f   ` 5 0 5 `   t o k e n s   s h o u l d 
           *   b e   d i s p l a y e d   t o   a   u s e r   a s   ` 5 . 0 5 `   ( ` 5 0 5   /   1 0   * *   2 ` ) . 
           * 
           *   T o k e n s   u s u a l l y   o p t   f o r   a   v a l u e   o f   1 8 ,   i m i t a t i n g   t h e   r e l a t i o n s h i p   b e t w e e n 
           *   E t h e r   a n d   W e i .   T h i s   i s   t h e   v a l u e   { E R C 2 0 }   u s e s ,   u n l e s s   t h i s   f u n c t i o n   i s 
           *   o v e r r i d d e n ; 
           * 
           *   N O T E :   T h i s   i n f o r m a t i o n   i s   o n l y   u s e d   f o r   _ d i s p l a y _   p u r p o s e s :   i t   i n 
           *   n o   w a y   a f f e c t s   a n y   o f   t h e   a r i t h m e t i c   o f   t h e   c o n t r a c t ,   i n c l u d i n g 
           *   { I E R C 2 0 - b a l a n c e O f }   a n d   { I E R C 2 0 - t r a n s f e r } . 
           * / 
         f u n c t i o n   d e c i m a l s ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 8 )   { 
                 r e t u r n   1 8 ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - t o t a l S u p p l y } . 
           * / 
         f u n c t i o n   t o t a l S u p p l y ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 2 5 6 )   { 
                 r e t u r n   _ t o t a l S u p p l y ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - b a l a n c e O f } . 
           * / 
         f u n c t i o n   b a l a n c e O f ( a d d r e s s   a c c o u n t )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 2 5 6 )   { 
                 r e t u r n   _ b a l a n c e s [ a c c o u n t ] ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - t r a n s f e r } . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` t o `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   t h e   c a l l e r   m u s t   h a v e   a   b a l a n c e   o f   a t   l e a s t   ` a m o u n t ` . 
           * / 
         f u n c t i o n   t r a n s f e r ( a d d r e s s   t o ,   u i n t 2 5 6   a m o u n t )   p u b l i c   v i r t u a l   o v e r r i d e   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 _ t r a n s f e r ( o w n e r ,   t o ,   a m o u n t ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - a l l o w a n c e } . 
           * / 
         f u n c t i o n   a l l o w a n c e ( a d d r e s s   o w n e r ,   a d d r e s s   s p e n d e r )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 2 5 6 )   { 
                 r e t u r n   _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ] ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - a p p r o v e } . 
           * 
           *   N O T E :   I f   ` a m o u n t `   i s   t h e   m a x i m u m   ` u i n t 2 5 6 ` ,   t h e   a l l o w a n c e   i s   n o t   u p d a t e d   o n 
           *   ` t r a n s f e r F r o m ` .   T h i s   i s   s e m a n t i c a l l y   e q u i v a l e n t   t o   a n   i n f i n i t e   a p p r o v a l . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   a p p r o v e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   a m o u n t )   p u b l i c   v i r t u a l   o v e r r i d e   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 _ a p p r o v e ( o w n e r ,   s p e n d e r ,   a m o u n t ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - t r a n s f e r F r o m } . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t   i n d i c a t i n g   t h e   u p d a t e d   a l l o w a n c e .   T h i s   i s   n o t 
           *   r e q u i r e d   b y   t h e   E I P .   S e e   t h e   n o t e   a t   t h e   b e g i n n i n g   o f   { E R C 2 0 } . 
           * 
           *   N O T E :   D o e s   n o t   u p d a t e   t h e   a l l o w a n c e   i f   t h e   c u r r e n t   a l l o w a n c e 
           *   i s   t h e   m a x i m u m   ` u i n t 2 5 6 ` . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` f r o m `   a n d   ` t o `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` f r o m `   m u s t   h a v e   a   b a l a n c e   o f   a t   l e a s t   ` a m o u n t ` . 
           *   -   t h e   c a l l e r   m u s t   h a v e   a l l o w a n c e   f o r   ` ` f r o m ` ` ' s   t o k e n s   o f   a t   l e a s t 
           *   ` a m o u n t ` . 
           * / 
         f u n c t i o n   t r a n s f e r F r o m ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   p u b l i c   v i r t u a l   o v e r r i d e   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   s p e n d e r   =   _ m s g S e n d e r ( ) ; 
                 _ s p e n d A l l o w a n c e ( f r o m ,   s p e n d e r ,   a m o u n t ) ; 
                 _ t r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   A t o m i c a l l y   i n c r e a s e s   t h e   a l l o w a n c e   g r a n t e d   t o   ` s p e n d e r `   b y   t h e   c a l l e r . 
           * 
           *   T h i s   i s   a n   a l t e r n a t i v e   t o   { a p p r o v e }   t h a t   c a n   b e   u s e d   a s   a   m i t i g a t i o n   f o r 
           *   p r o b l e m s   d e s c r i b e d   i n   { I E R C 2 0 - a p p r o v e } . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t   i n d i c a t i n g   t h e   u p d a t e d   a l l o w a n c e . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   i n c r e a s e A l l o w a n c e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   a d d e d V a l u e )   p u b l i c   v i r t u a l   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 _ a p p r o v e ( o w n e r ,   s p e n d e r ,   _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ]   +   a d d e d V a l u e ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   A t o m i c a l l y   d e c r e a s e s   t h e   a l l o w a n c e   g r a n t e d   t o   ` s p e n d e r `   b y   t h e   c a l l e r . 
           * 
           *   T h i s   i s   a n   a l t e r n a t i v e   t o   { a p p r o v e }   t h a t   c a n   b e   u s e d   a s   a   m i t i g a t i o n   f o r 
           *   p r o b l e m s   d e s c r i b e d   i n   { I E R C 2 0 - a p p r o v e } . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t   i n d i c a t i n g   t h e   u p d a t e d   a l l o w a n c e . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` s p e n d e r `   m u s t   h a v e   a l l o w a n c e   f o r   t h e   c a l l e r   o f   a t   l e a s t 
           *   ` s u b t r a c t e d V a l u e ` . 
           * / 
         f u n c t i o n   d e c r e a s e A l l o w a n c e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   s u b t r a c t e d V a l u e )   p u b l i c   v i r t u a l   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 u i n t 2 5 6   c u r r e n t A l l o w a n c e   =   _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ] ; 
                 r e q u i r e ( c u r r e n t A l l o w a n c e   > =   s u b t r a c t e d V a l u e ,   " E R C 2 0 :   d e c r e a s e d   a l l o w a n c e   b e l o w   z e r o " ) ; 
                 u n c h e c k e d   { 
                         _ a p p r o v e ( o w n e r ,   s p e n d e r ,   c u r r e n t A l l o w a n c e   -   s u b t r a c t e d V a l u e ) ; 
                 } 
 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   M o v e s   ` a m o u n t `   o f   t o k e n s   f r o m   ` s e n d e r `   t o   ` r e c i p i e n t ` . 
           * 
           *   T h i s   i n t e r n a l   f u n c t i o n   i s   e q u i v a l e n t   t o   { t r a n s f e r } ,   a n d   c a n   b e   u s e d   t o 
           *   e . g .   i m p l e m e n t   a u t o m a t i c   t o k e n   f e e s ,   s l a s h i n g   m e c h a n i s m s ,   e t c . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` f r o m `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` t o `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` f r o m `   m u s t   h a v e   a   b a l a n c e   o f   a t   l e a s t   ` a m o u n t ` . 
           * / 
         f u n c t i o n   _ t r a n s f e r ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( f r o m   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   t r a n s f e r   f r o m   t h e   z e r o   a d d r e s s " ) ; 
                 r e q u i r e ( t o   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   t r a n s f e r   t o   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ b e f o r e T o k e n T r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
 
                 u i n t 2 5 6   f r o m B a l a n c e   =   _ b a l a n c e s [ f r o m ] ; 
                 r e q u i r e ( f r o m B a l a n c e   > =   a m o u n t ,   " E R C 2 0 :   t r a n s f e r   a m o u n t   e x c e e d s   b a l a n c e " ) ; 
                 u n c h e c k e d   { 
                         _ b a l a n c e s [ f r o m ]   =   f r o m B a l a n c e   -   a m o u n t ; 
                 } 
                 _ b a l a n c e s [ t o ]   + =   a m o u n t ; 
 
                 e m i t   T r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
 
                 _ a f t e r T o k e n T r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
         } 
 
         / * *   @ d e v   C r e a t e s   ` a m o u n t `   t o k e n s   a n d   a s s i g n s   t h e m   t o   ` a c c o u n t ` ,   i n c r e a s i n g 
           *   t h e   t o t a l   s u p p l y . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t   w i t h   ` f r o m `   s e t   t o   t h e   z e r o   a d d r e s s . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` a c c o u n t `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   _ m i n t ( a d d r e s s   a c c o u n t ,   u i n t 2 5 6   a m o u n t )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( a c c o u n t   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   m i n t   t o   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ b e f o r e T o k e n T r a n s f e r ( a d d r e s s ( 0 ) ,   a c c o u n t ,   a m o u n t ) ; 
 
                 _ t o t a l S u p p l y   + =   a m o u n t ; 
                 _ b a l a n c e s [ a c c o u n t ]   + =   a m o u n t ; 
                 e m i t   T r a n s f e r ( a d d r e s s ( 0 ) ,   a c c o u n t ,   a m o u n t ) ; 
 
                 _ a f t e r T o k e n T r a n s f e r ( a d d r e s s ( 0 ) ,   a c c o u n t ,   a m o u n t ) ; 
         } 
 
         / * * 
           *   @ d e v   D e s t r o y s   ` a m o u n t `   t o k e n s   f r o m   ` a c c o u n t ` ,   r e d u c i n g   t h e 
           *   t o t a l   s u p p l y . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t   w i t h   ` t o `   s e t   t o   t h e   z e r o   a d d r e s s . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` a c c o u n t `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` a c c o u n t `   m u s t   h a v e   a t   l e a s t   ` a m o u n t `   t o k e n s . 
           * / 
         f u n c t i o n   _ b u r n ( a d d r e s s   a c c o u n t ,   u i n t 2 5 6   a m o u n t )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( a c c o u n t   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   b u r n   f r o m   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ b e f o r e T o k e n T r a n s f e r ( a c c o u n t ,   a d d r e s s ( 0 ) ,   a m o u n t ) ; 
 
                 u i n t 2 5 6   a c c o u n t B a l a n c e   =   _ b a l a n c e s [ a c c o u n t ] ; 
                 r e q u i r e ( a c c o u n t B a l a n c e   > =   a m o u n t ,   " E R C 2 0 :   b u r n   a m o u n t   e x c e e d s   b a l a n c e " ) ; 
                 u n c h e c k e d   { 
                         _ b a l a n c e s [ a c c o u n t ]   =   a c c o u n t B a l a n c e   -   a m o u n t ; 
                 } 
                 _ t o t a l S u p p l y   - =   a m o u n t ; 
 
                 e m i t   T r a n s f e r ( a c c o u n t ,   a d d r e s s ( 0 ) ,   a m o u n t ) ; 
 
                 _ a f t e r T o k e n T r a n s f e r ( a c c o u n t ,   a d d r e s s ( 0 ) ,   a m o u n t ) ; 
         } 
 
         / * * 
           *   @ d e v   S e t s   ` a m o u n t `   a s   t h e   a l l o w a n c e   o f   ` s p e n d e r `   o v e r   t h e   ` o w n e r `   s   t o k e n s . 
           * 
           *   T h i s   i n t e r n a l   f u n c t i o n   i s   e q u i v a l e n t   t o   ` a p p r o v e ` ,   a n d   c a n   b e   u s e d   t o 
           *   e . g .   s e t   a u t o m a t i c   a l l o w a n c e s   f o r   c e r t a i n   s u b s y s t e m s ,   e t c . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` o w n e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   _ a p p r o v e ( 
                 a d d r e s s   o w n e r , 
                 a d d r e s s   s p e n d e r , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( o w n e r   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   a p p r o v e   f r o m   t h e   z e r o   a d d r e s s " ) ; 
                 r e q u i r e ( s p e n d e r   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   a p p r o v e   t o   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ]   =   a m o u n t ; 
                 e m i t   A p p r o v a l ( o w n e r ,   s p e n d e r ,   a m o u n t ) ; 
         } 
 
         / * * 
           *   @ d e v   S p e n d   ` a m o u n t `   f o r m   t h e   a l l o w a n c e   o f   ` o w n e r `   t o w a r d   ` s p e n d e r ` . 
           * 
           *   D o e s   n o t   u p d a t e   t h e   a l l o w a n c e   a m o u n t   i n   c a s e   o f   i n f i n i t e   a l l o w a n c e . 
           *   R e v e r t   i f   n o t   e n o u g h   a l l o w a n c e   i s   a v a i l a b l e . 
           * 
           *   M i g h t   e m i t   a n   { A p p r o v a l }   e v e n t . 
           * / 
         f u n c t i o n   _ s p e n d A l l o w a n c e ( 
                 a d d r e s s   o w n e r , 
                 a d d r e s s   s p e n d e r , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { 
                 u i n t 2 5 6   c u r r e n t A l l o w a n c e   =   a l l o w a n c e ( o w n e r ,   s p e n d e r ) ; 
                 i f   ( c u r r e n t A l l o w a n c e   ! =   t y p e ( u i n t 2 5 6 ) . m a x )   { 
                         r e q u i r e ( c u r r e n t A l l o w a n c e   > =   a m o u n t ,   " E R C 2 0 :   i n s u f f i c i e n t   a l l o w a n c e " ) ; 
                         u n c h e c k e d   { 
                                 _ a p p r o v e ( o w n e r ,   s p e n d e r ,   c u r r e n t A l l o w a n c e   -   a m o u n t ) ; 
                         } 
                 } 
         } 
 
         / * * 
           *   @ d e v   H o o k   t h a t   i s   c a l l e d   b e f o r e   a n y   t r a n s f e r   o f   t o k e n s .   T h i s   i n c l u d e s 
           *   m i n t i n g   a n d   b u r n i n g . 
           * 
           *   C a l l i n g   c o n d i t i o n s : 
           * 
           *   -   w h e n   ` f r o m `   a n d   ` t o `   a r e   b o t h   n o n - z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s 
           *   w i l l   b e   t r a n s f e r r e d   t o   ` t o ` . 
           *   -   w h e n   ` f r o m `   i s   z e r o ,   ` a m o u n t `   t o k e n s   w i l l   b e   m i n t e d   f o r   ` t o ` . 
           *   -   w h e n   ` t o `   i s   z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s   w i l l   b e   b u r n e d . 
           *   -   ` f r o m `   a n d   ` t o `   a r e   n e v e r   b o t h   z e r o . 
           * 
           *   T o   l e a r n   m o r e   a b o u t   h o o k s ,   h e a d   t o   x r e f : R O O T : e x t e n d i n g - c o n t r a c t s . a d o c # u s i n g - h o o k s [ U s i n g   H o o k s ] . 
           * / 
         f u n c t i o n   _ b e f o r e T o k e n T r a n s f e r ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { } 
 
         / * * 
           *   @ d e v   H o o k   t h a t   i s   c a l l e d   a f t e r   a n y   t r a n s f e r   o f   t o k e n s .   T h i s   i n c l u d e s 
           *   m i n t i n g   a n d   b u r n i n g . 
           * 
           *   C a l l i n g   c o n d i t i o n s : 
           * 
           *   -   w h e n   ` f r o m `   a n d   ` t o `   a r e   b o t h   n o n - z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s 
           *   h a s   b e e n   t r a n s f e r r e d   t o   ` t o ` . 
           *   -   w h e n   ` f r o m `   i s   z e r o ,   ` a m o u n t `   t o k e n s   h a v e   b e e n   m i n t e d   f o r   ` t o ` . 
           *   -   w h e n   ` t o `   i s   z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s   h a v e   b e e n   b u r n e d . 
           *   -   ` f r o m `   a n d   ` t o `   a r e   n e v e r   b o t h   z e r o . 
           * 
           *   T o   l e a r n   m o r e   a b o u t   h o o k s ,   h e a d   t o   x r e f : R O O T : e x t e n d i n g - c o n t r a c t s . a d o c # u s i n g - h o o k s [ U s i n g   H o o k s ] . 
           * / 
         f u n c t i o n   _ a f t e r T o k e n T r a n s f e r ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { } 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s - u p g r a d e a b l e / u t i l s / A d d r e s s U p g r a d e a b l e . s o l @ v 4 . 5 . 2 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   ( l a s t   u p d a t e d   v 4 . 5 . 0 )   ( u t i l s / A d d r e s s . s o l ) 
 
 
 
 / * * 
   *   @ d e v   C o l l e c t i o n   o f   f u n c t i o n s   r e l a t e d   t o   t h e   a d d r e s s   t y p e 
   * / 
 l i b r a r y   A d d r e s s U p g r a d e a b l e   { 
         / * * 
           *   @ d e v   R e t u r n s   t r u e   i f   ` a c c o u n t `   i s   a   c o n t r a c t . 
           * 
           *   [ I M P O R T A N T ] 
           *   = = = = 
           *   I t   i s   u n s a f e   t o   a s s u m e   t h a t   a n   a d d r e s s   f o r   w h i c h   t h i s   f u n c t i o n   r e t u r n s 
           *   f a l s e   i s   a n   e x t e r n a l l y - o w n e d   a c c o u n t   ( E O A )   a n d   n o t   a   c o n t r a c t . 
           * 
           *   A m o n g   o t h e r s ,   ` i s C o n t r a c t `   w i l l   r e t u r n   f a l s e   f o r   t h e   f o l l o w i n g 
           *   t y p e s   o f   a d d r e s s e s : 
           * 
           *     -   a n   e x t e r n a l l y - o w n e d   a c c o u n t 
           *     -   a   c o n t r a c t   i n   c o n s t r u c t i o n 
           *     -   a n   a d d r e s s   w h e r e   a   c o n t r a c t   w i l l   b e   c r e a t e d 
           *     -   a n   a d d r e s s   w h e r e   a   c o n t r a c t   l i v e d ,   b u t   w a s   d e s t r o y e d 
           *   = = = = 
           * 
           *   [ I M P O R T A N T ] 
           *   = = = = 
           *   Y o u   s h o u l d n ' t   r e l y   o n   ` i s C o n t r a c t `   t o   p r o t e c t   a g a i n s t   f l a s h   l o a n   a t t a c k s ! 
           * 
           *   P r e v e n t i n g   c a l l s   f r o m   c o n t r a c t s   i s   h i g h l y   d i s c o u r a g e d .   I t   b r e a k s   c o m p o s a b i l i t y ,   b r e a k s   s u p p o r t   f o r   s m a r t   w a l l e t s 
           *   l i k e   G n o s i s   S a f e ,   a n d   d o e s   n o t   p r o v i d e   s e c u r i t y   s i n c e   i t   c a n   b e   c i r c u m v e n t e d   b y   c a l l i n g   f r o m   a   c o n t r a c t 
           *   c o n s t r u c t o r . 
           *   = = = = 
           * / 
         f u n c t i o n   i s C o n t r a c t ( a d d r e s s   a c c o u n t )   i n t e r n a l   v i e w   r e t u r n s   ( b o o l )   { 
                 / /   T h i s   m e t h o d   r e l i e s   o n   e x t c o d e s i z e / a d d r e s s . c o d e . l e n g t h ,   w h i c h   r e t u r n s   0 
                 / /   f o r   c o n t r a c t s   i n   c o n s t r u c t i o n ,   s i n c e   t h e   c o d e   i s   o n l y   s t o r e d   a t   t h e   e n d 
                 / /   o f   t h e   c o n s t r u c t o r   e x e c u t i o n . 
 
                 r e t u r n   a c c o u n t . c o d e . l e n g t h   >   0 ; 
         } 
 
         / * * 
           *   @ d e v   R e p l a c e m e n t   f o r   S o l i d i t y ' s   ` t r a n s f e r ` :   s e n d s   ` a m o u n t `   w e i   t o 
           *   ` r e c i p i e n t ` ,   f o r w a r d i n g   a l l   a v a i l a b l e   g a s   a n d   r e v e r t i n g   o n   e r r o r s . 
           * 
           *   h t t p s : / / e i p s . e t h e r e u m . o r g / E I P S / e i p - 1 8 8 4 [ E I P 1 8 8 4 ]   i n c r e a s e s   t h e   g a s   c o s t 
           *   o f   c e r t a i n   o p c o d e s ,   p o s s i b l y   m a k i n g   c o n t r a c t s   g o   o v e r   t h e   2 3 0 0   g a s   l i m i t 
           *   i m p o s e d   b y   ` t r a n s f e r ` ,   m a k i n g   t h e m   u n a b l e   t o   r e c e i v e   f u n d s   v i a 
           *   ` t r a n s f e r ` .   { s e n d V a l u e }   r e m o v e s   t h i s   l i m i t a t i o n . 
           * 
           *   h t t p s : / / d i l i g e n c e . c o n s e n s y s . n e t / p o s t s / 2 0 1 9 / 0 9 / s t o p - u s i n g - s o l i d i t y s - t r a n s f e r - n o w / [ L e a r n   m o r e ] . 
           * 
           *   I M P O R T A N T :   b e c a u s e   c o n t r o l   i s   t r a n s f e r r e d   t o   ` r e c i p i e n t ` ,   c a r e   m u s t   b e 
           *   t a k e n   t o   n o t   c r e a t e   r e e n t r a n c y   v u l n e r a b i l i t i e s .   C o n s i d e r   u s i n g 
           *   { R e e n t r a n c y G u a r d }   o r   t h e 
           *   h t t p s : / / s o l i d i t y . r e a d t h e d o c s . i o / e n / v 0 . 5 . 1 1 / s e c u r i t y - c o n s i d e r a t i o n s . h t m l # u s e - t h e - c h e c k s - e f f e c t s - i n t e r a c t i o n s - p a t t e r n [ c h e c k s - e f f e c t s - i n t e r a c t i o n s   p a t t e r n ] . 
           * / 
         f u n c t i o n   s e n d V a l u e ( a d d r e s s   p a y a b l e   r e c i p i e n t ,   u i n t 2 5 6   a m o u n t )   i n t e r n a l   { 
                 r e q u i r e ( a d d r e s s ( t h i s ) . b a l a n c e   > =   a m o u n t ,   " A d d r e s s :   i n s u f f i c i e n t   b a l a n c e " ) ; 
 
                 ( b o o l   s u c c e s s ,   )   =   r e c i p i e n t . c a l l { v a l u e :   a m o u n t } ( " " ) ; 
                 r e q u i r e ( s u c c e s s ,   " A d d r e s s :   u n a b l e   t o   s e n d   v a l u e ,   r e c i p i e n t   m a y   h a v e   r e v e r t e d " ) ; 
         } 
 
         / * * 
           *   @ d e v   P e r f o r m s   a   S o l i d i t y   f u n c t i o n   c a l l   u s i n g   a   l o w   l e v e l   ` c a l l ` .   A 
           *   p l a i n   ` c a l l `   i s   a n   u n s a f e   r e p l a c e m e n t   f o r   a   f u n c t i o n   c a l l :   u s e   t h i s 
           *   f u n c t i o n   i n s t e a d . 
           * 
           *   I f   ` t a r g e t `   r e v e r t s   w i t h   a   r e v e r t   r e a s o n ,   i t   i s   b u b b l e d   u p   b y   t h i s 
           *   f u n c t i o n   ( l i k e   r e g u l a r   S o l i d i t y   f u n c t i o n   c a l l s ) . 
           * 
           *   R e t u r n s   t h e   r a w   r e t u r n e d   d a t a .   T o   c o n v e r t   t o   t h e   e x p e c t e d   r e t u r n   v a l u e , 
           *   u s e   h t t p s : / / s o l i d i t y . r e a d t h e d o c s . i o / e n / l a t e s t / u n i t s - a n d - g l o b a l - v a r i a b l e s . h t m l ? h i g h l i g h t = a b i . d e c o d e # a b i - e n c o d i n g - a n d - d e c o d i n g - f u n c t i o n s [ ` a b i . d e c o d e ` ] . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` t a r g e t `   m u s t   b e   a   c o n t r a c t . 
           *   -   c a l l i n g   ` t a r g e t `   w i t h   ` d a t a `   m u s t   n o t   r e v e r t . 
           * 
           *   _ A v a i l a b l e   s i n c e   v 3 . 1 . _ 
           * / 
         f u n c t i o n   f u n c t i o n C a l l ( a d d r e s s   t a r g e t ,   b y t e s   m e m o r y   d a t a )   i n t e r n a l   r e t u r n s   ( b y t e s   m e m o r y )   { 
                 r e t u r n   f u n c t i o n C a l l ( t a r g e t ,   d a t a ,   " A d d r e s s :   l o w - l e v e l   c a l l   f a i l e d " ) ; 
         } 
 
         / * * 
           *   @ d e v   S a m e   a s   { x r e f - A d d r e s s - f u n c t i o n C a l l - a d d r e s s - b y t e s - } [ ` f u n c t i o n C a l l ` ] ,   b u t   w i t h 
           *   ` e r r o r M e s s a g e `   a s   a   f a l l b a c k   r e v e r t   r e a s o n   w h e n   ` t a r g e t `   r e v e r t s . 
           * 
           *   _ A v a i l a b l e   s i n c e   v 3 . 1 . _ 
           * / 
         f u n c t i o n   f u n c t i o n C a l l ( 
                 a d d r e s s   t a r g e t , 
                 b y t e s   m e m o r y   d a t a , 
                 s t r i n g   m e m o r y   e r r o r M e s s a g e 
         )   i n t e r n a l   r e t u r n s   ( b y t e s   m e m o r y )   { 
                 r e t u r n   f u n c t i o n C a l l W i t h V a l u e ( t a r g e t ,   d a t a ,   0 ,   e r r o r M e s s a g e ) ; 
         } 
 
         / * * 
           *   @ d e v   S a m e   a s   { x r e f - A d d r e s s - f u n c t i o n C a l l - a d d r e s s - b y t e s - } [ ` f u n c t i o n C a l l ` ] , 
           *   b u t   a l s o   t r a n s f e r r i n g   ` v a l u e `   w e i   t o   ` t a r g e t ` . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   t h e   c a l l i n g   c o n t r a c t   m u s t   h a v e   a n   E T H   b a l a n c e   o f   a t   l e a s t   ` v a l u e ` . 
           *   -   t h e   c a l l e d   S o l i d i t y   f u n c t i o n   m u s t   b e   ` p a y a b l e ` . 
           * 
           *   _ A v a i l a b l e   s i n c e   v 3 . 1 . _ 
           * / 
         f u n c t i o n   f u n c t i o n C a l l W i t h V a l u e ( 
                 a d d r e s s   t a r g e t , 
                 b y t e s   m e m o r y   d a t a , 
                 u i n t 2 5 6   v a l u e 
         )   i n t e r n a l   r e t u r n s   ( b y t e s   m e m o r y )   { 
                 r e t u r n   f u n c t i o n C a l l W i t h V a l u e ( t a r g e t ,   d a t a ,   v a l u e ,   " A d d r e s s :   l o w - l e v e l   c a l l   w i t h   v a l u e   f a i l e d " ) ; 
         } 
 
         / * * 
           *   @ d e v   S a m e   a s   { x r e f - A d d r e s s - f u n c t i o n C a l l W i t h V a l u e - a d d r e s s - b y t e s - u i n t 2 5 6 - } [ ` f u n c t i o n C a l l W i t h V a l u e ` ] ,   b u t 
           *   w i t h   ` e r r o r M e s s a g e `   a s   a   f a l l b a c k   r e v e r t   r e a s o n   w h e n   ` t a r g e t `   r e v e r t s . 
           * 
           *   _ A v a i l a b l e   s i n c e   v 3 . 1 . _ 
           * / 
         f u n c t i o n   f u n c t i o n C a l l W i t h V a l u e ( 
                 a d d r e s s   t a r g e t , 
                 b y t e s   m e m o r y   d a t a , 
                 u i n t 2 5 6   v a l u e , 
                 s t r i n g   m e m o r y   e r r o r M e s s a g e 
         )   i n t e r n a l   r e t u r n s   ( b y t e s   m e m o r y )   { 
                 r e q u i r e ( a d d r e s s ( t h i s ) . b a l a n c e   > =   v a l u e ,   " A d d r e s s :   i n s u f f i c i e n t   b a l a n c e   f o r   c a l l " ) ; 
                 r e q u i r e ( i s C o n t r a c t ( t a r g e t ) ,   " A d d r e s s :   c a l l   t o   n o n - c o n t r a c t " ) ; 
 
                 ( b o o l   s u c c e s s ,   b y t e s   m e m o r y   r e t u r n d a t a )   =   t a r g e t . c a l l { v a l u e :   v a l u e } ( d a t a ) ; 
                 r e t u r n   v e r i f y C a l l R e s u l t ( s u c c e s s ,   r e t u r n d a t a ,   e r r o r M e s s a g e ) ; 
         } 
 
         / * * 
           *   @ d e v   S a m e   a s   { x r e f - A d d r e s s - f u n c t i o n C a l l - a d d r e s s - b y t e s - } [ ` f u n c t i o n C a l l ` ] , 
           *   b u t   p e r f o r m i n g   a   s t a t i c   c a l l . 
           * 
           *   _ A v a i l a b l e   s i n c e   v 3 . 3 . _ 
           * / 
         f u n c t i o n   f u n c t i o n S t a t i c C a l l ( a d d r e s s   t a r g e t ,   b y t e s   m e m o r y   d a t a )   i n t e r n a l   v i e w   r e t u r n s   ( b y t e s   m e m o r y )   { 
                 r e t u r n   f u n c t i o n S t a t i c C a l l ( t a r g e t ,   d a t a ,   " A d d r e s s :   l o w - l e v e l   s t a t i c   c a l l   f a i l e d " ) ; 
         } 
 
         / * * 
           *   @ d e v   S a m e   a s   { x r e f - A d d r e s s - f u n c t i o n C a l l - a d d r e s s - b y t e s - s t r i n g - } [ ` f u n c t i o n C a l l ` ] , 
           *   b u t   p e r f o r m i n g   a   s t a t i c   c a l l . 
           * 
           *   _ A v a i l a b l e   s i n c e   v 3 . 3 . _ 
           * / 
         f u n c t i o n   f u n c t i o n S t a t i c C a l l ( 
                 a d d r e s s   t a r g e t , 
                 b y t e s   m e m o r y   d a t a , 
                 s t r i n g   m e m o r y   e r r o r M e s s a g e 
         )   i n t e r n a l   v i e w   r e t u r n s   ( b y t e s   m e m o r y )   { 
                 r e q u i r e ( i s C o n t r a c t ( t a r g e t ) ,   " A d d r e s s :   s t a t i c   c a l l   t o   n o n - c o n t r a c t " ) ; 
 
                 ( b o o l   s u c c e s s ,   b y t e s   m e m o r y   r e t u r n d a t a )   =   t a r g e t . s t a t i c c a l l ( d a t a ) ; 
                 r e t u r n   v e r i f y C a l l R e s u l t ( s u c c e s s ,   r e t u r n d a t a ,   e r r o r M e s s a g e ) ; 
         } 
 
         / * * 
           *   @ d e v   T o o l   t o   v e r i f i e s   t h a t   a   l o w   l e v e l   c a l l   w a s   s u c c e s s f u l ,   a n d   r e v e r t   i f   i t   w a s n ' t ,   e i t h e r   b y   b u b b l i n g   t h e 
           *   r e v e r t   r e a s o n   u s i n g   t h e   p r o v i d e d   o n e . 
           * 
           *   _ A v a i l a b l e   s i n c e   v 4 . 3 . _ 
           * / 
         f u n c t i o n   v e r i f y C a l l R e s u l t ( 
                 b o o l   s u c c e s s , 
                 b y t e s   m e m o r y   r e t u r n d a t a , 
                 s t r i n g   m e m o r y   e r r o r M e s s a g e 
         )   i n t e r n a l   p u r e   r e t u r n s   ( b y t e s   m e m o r y )   { 
                 i f   ( s u c c e s s )   { 
                         r e t u r n   r e t u r n d a t a ; 
                 }   e l s e   { 
                         / /   L o o k   f o r   r e v e r t   r e a s o n   a n d   b u b b l e   i t   u p   i f   p r e s e n t 
                         i f   ( r e t u r n d a t a . l e n g t h   >   0 )   { 
                                 / /   T h e   e a s i e s t   w a y   t o   b u b b l e   t h e   r e v e r t   r e a s o n   i s   u s i n g   m e m o r y   v i a   a s s e m b l y 
 
                                 a s s e m b l y   { 
                                         l e t   r e t u r n d a t a _ s i z e   : =   m l o a d ( r e t u r n d a t a ) 
                                         r e v e r t ( a d d ( 3 2 ,   r e t u r n d a t a ) ,   r e t u r n d a t a _ s i z e ) 
                                 } 
                         }   e l s e   { 
                                 r e v e r t ( e r r o r M e s s a g e ) ; 
                         } 
                 } 
         } 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s - u p g r a d e a b l e / p r o x y / u t i l s / I n i t i a l i z a b l e . s o l @ v 4 . 5 . 2 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   ( l a s t   u p d a t e d   v 4 . 5 . 0 )   ( p r o x y / u t i l s / I n i t i a l i z a b l e . s o l ) 
 
 
 
 / * * 
   *   @ d e v   T h i s   i s   a   b a s e   c o n t r a c t   t o   a i d   i n   w r i t i n g   u p g r a d e a b l e   c o n t r a c t s ,   o r   a n y   k i n d   o f   c o n t r a c t   t h a t   w i l l   b e   d e p l o y e d 
   *   b e h i n d   a   p r o x y .   S i n c e   p r o x i e d   c o n t r a c t s   d o   n o t   m a k e   u s e   o f   a   c o n s t r u c t o r ,   i t ' s   c o m m o n   t o   m o v e   c o n s t r u c t o r   l o g i c   t o   a n 
   *   e x t e r n a l   i n i t i a l i z e r   f u n c t i o n ,   u s u a l l y   c a l l e d   ` i n i t i a l i z e ` .   I t   t h e n   b e c o m e s   n e c e s s a r y   t o   p r o t e c t   t h i s   i n i t i a l i z e r 
   *   f u n c t i o n   s o   i t   c a n   o n l y   b e   c a l l e d   o n c e .   T h e   { i n i t i a l i z e r }   m o d i f i e r   p r o v i d e d   b y   t h i s   c o n t r a c t   w i l l   h a v e   t h i s   e f f e c t . 
   * 
   *   T I P :   T o   a v o i d   l e a v i n g   t h e   p r o x y   i n   a n   u n i n i t i a l i z e d   s t a t e ,   t h e   i n i t i a l i z e r   f u n c t i o n   s h o u l d   b e   c a l l e d   a s   e a r l y   a s 
   *   p o s s i b l e   b y   p r o v i d i n g   t h e   e n c o d e d   f u n c t i o n   c a l l   a s   t h e   ` _ d a t a `   a r g u m e n t   t o   { E R C 1 9 6 7 P r o x y - c o n s t r u c t o r } . 
   * 
   *   C A U T I O N :   W h e n   u s e d   w i t h   i n h e r i t a n c e ,   m a n u a l   c a r e   m u s t   b e   t a k e n   t o   n o t   i n v o k e   a   p a r e n t   i n i t i a l i z e r   t w i c e ,   o r   t o   e n s u r e 
   *   t h a t   a l l   i n i t i a l i z e r s   a r e   i d e m p o t e n t .   T h i s   i s   n o t   v e r i f i e d   a u t o m a t i c a l l y   a s   c o n s t r u c t o r s   a r e   b y   S o l i d i t y . 
   * 
   *   [ C A U T I O N ] 
   *   = = = = 
   *   A v o i d   l e a v i n g   a   c o n t r a c t   u n i n i t i a l i z e d . 
   * 
   *   A n   u n i n i t i a l i z e d   c o n t r a c t   c a n   b e   t a k e n   o v e r   b y   a n   a t t a c k e r .   T h i s   a p p l i e s   t o   b o t h   a   p r o x y   a n d   i t s   i m p l e m e n t a t i o n 
   *   c o n t r a c t ,   w h i c h   m a y   i m p a c t   t h e   p r o x y .   T o   i n i t i a l i z e   t h e   i m p l e m e n t a t i o n   c o n t r a c t ,   y o u   c a n   e i t h e r   i n v o k e   t h e 
   *   i n i t i a l i z e r   m a n u a l l y ,   o r   y o u   c a n   i n c l u d e   a   c o n s t r u c t o r   t o   a u t o m a t i c a l l y   m a r k   i t   a s   i n i t i a l i z e d   w h e n   i t   i s   d e p l o y e d : 
   * 
   *   [ . h l j s - t h e m e - l i g h t . n o p a d d i n g ] 
   *   ` ` ` 
   *   / / /   @ c u s t o m : o z - u p g r a d e s - u n s a f e - a l l o w   c o n s t r u c t o r 
   *   c o n s t r u c t o r ( )   i n i t i a l i z e r   { } 
   *   ` ` ` 
   *   = = = = 
   * / 
 a b s t r a c t   c o n t r a c t   I n i t i a l i z a b l e   { 
         / * * 
           *   @ d e v   I n d i c a t e s   t h a t   t h e   c o n t r a c t   h a s   b e e n   i n i t i a l i z e d . 
           * / 
         b o o l   p r i v a t e   _ i n i t i a l i z e d ; 
 
         / * * 
           *   @ d e v   I n d i c a t e s   t h a t   t h e   c o n t r a c t   i s   i n   t h e   p r o c e s s   o f   b e i n g   i n i t i a l i z e d . 
           * / 
         b o o l   p r i v a t e   _ i n i t i a l i z i n g ; 
 
         / * * 
           *   @ d e v   M o d i f i e r   t o   p r o t e c t   a n   i n i t i a l i z e r   f u n c t i o n   f r o m   b e i n g   i n v o k e d   t w i c e . 
           * / 
         m o d i f i e r   i n i t i a l i z e r ( )   { 
                 / /   I f   t h e   c o n t r a c t   i s   i n i t i a l i z i n g   w e   i g n o r e   w h e t h e r   _ i n i t i a l i z e d   i s   s e t   i n   o r d e r   t o   s u p p o r t   m u l t i p l e 
                 / /   i n h e r i t a n c e   p a t t e r n s ,   b u t   w e   o n l y   d o   t h i s   i n   t h e   c o n t e x t   o f   a   c o n s t r u c t o r ,   b e c a u s e   i n   o t h e r   c o n t e x t s   t h e 
                 / /   c o n t r a c t   m a y   h a v e   b e e n   r e e n t e r e d . 
                 r e q u i r e ( _ i n i t i a l i z i n g   ?   _ i s C o n s t r u c t o r ( )   :   ! _ i n i t i a l i z e d ,   " I n i t i a l i z a b l e :   c o n t r a c t   i s   a l r e a d y   i n i t i a l i z e d " ) ; 
 
                 b o o l   i s T o p L e v e l C a l l   =   ! _ i n i t i a l i z i n g ; 
                 i f   ( i s T o p L e v e l C a l l )   { 
                         _ i n i t i a l i z i n g   =   t r u e ; 
                         _ i n i t i a l i z e d   =   t r u e ; 
                 } 
 
                 _ ; 
 
                 i f   ( i s T o p L e v e l C a l l )   { 
                         _ i n i t i a l i z i n g   =   f a l s e ; 
                 } 
         } 
 
         / * * 
           *   @ d e v   M o d i f i e r   t o   p r o t e c t   a n   i n i t i a l i z a t i o n   f u n c t i o n   s o   t h a t   i t   c a n   o n l y   b e   i n v o k e d   b y   f u n c t i o n s   w i t h   t h e 
           *   { i n i t i a l i z e r }   m o d i f i e r ,   d i r e c t l y   o r   i n d i r e c t l y . 
           * / 
         m o d i f i e r   o n l y I n i t i a l i z i n g ( )   { 
                 r e q u i r e ( _ i n i t i a l i z i n g ,   " I n i t i a l i z a b l e :   c o n t r a c t   i s   n o t   i n i t i a l i z i n g " ) ; 
                 _ ; 
         } 
 
         f u n c t i o n   _ i s C o n s t r u c t o r ( )   p r i v a t e   v i e w   r e t u r n s   ( b o o l )   { 
                 r e t u r n   ! A d d r e s s U p g r a d e a b l e . i s C o n t r a c t ( a d d r e s s ( t h i s ) ) ; 
         } 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s - u p g r a d e a b l e / t o k e n / E R C 2 0 / I E R C 2 0 U p g r a d e a b l e . s o l @ v 4 . 5 . 2 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   ( l a s t   u p d a t e d   v 4 . 5 . 0 )   ( t o k e n / E R C 2 0 / I E R C 2 0 . s o l ) 
 
 
 
 / * * 
   *   @ d e v   I n t e r f a c e   o f   t h e   E R C 2 0   s t a n d a r d   a s   d e f i n e d   i n   t h e   E I P . 
   * / 
 i n t e r f a c e   I E R C 2 0 U p g r a d e a b l e   { 
         / * * 
           *   @ d e v   R e t u r n s   t h e   a m o u n t   o f   t o k e n s   i n   e x i s t e n c e . 
           * / 
         f u n c t i o n   t o t a l S u p p l y ( )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 2 5 6 ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   a m o u n t   o f   t o k e n s   o w n e d   b y   ` a c c o u n t ` . 
           * / 
         f u n c t i o n   b a l a n c e O f ( a d d r e s s   a c c o u n t )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 2 5 6 ) ; 
 
         / * * 
           *   @ d e v   M o v e s   ` a m o u n t `   t o k e n s   f r o m   t h e   c a l l e r ' s   a c c o u n t   t o   ` t o ` . 
           * 
           *   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   w h e t h e r   t h e   o p e r a t i o n   s u c c e e d e d . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t . 
           * / 
         f u n c t i o n   t r a n s f e r ( a d d r e s s   t o ,   u i n t 2 5 6   a m o u n t )   e x t e r n a l   r e t u r n s   ( b o o l ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   r e m a i n i n g   n u m b e r   o f   t o k e n s   t h a t   ` s p e n d e r `   w i l l   b e 
           *   a l l o w e d   t o   s p e n d   o n   b e h a l f   o f   ` o w n e r `   t h r o u g h   { t r a n s f e r F r o m } .   T h i s   i s 
           *   z e r o   b y   d e f a u l t . 
           * 
           *   T h i s   v a l u e   c h a n g e s   w h e n   { a p p r o v e }   o r   { t r a n s f e r F r o m }   a r e   c a l l e d . 
           * / 
         f u n c t i o n   a l l o w a n c e ( a d d r e s s   o w n e r ,   a d d r e s s   s p e n d e r )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 2 5 6 ) ; 
 
         / * * 
           *   @ d e v   S e t s   ` a m o u n t `   a s   t h e   a l l o w a n c e   o f   ` s p e n d e r `   o v e r   t h e   c a l l e r ' s   t o k e n s . 
           * 
           *   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   w h e t h e r   t h e   o p e r a t i o n   s u c c e e d e d . 
           * 
           *   I M P O R T A N T :   B e w a r e   t h a t   c h a n g i n g   a n   a l l o w a n c e   w i t h   t h i s   m e t h o d   b r i n g s   t h e   r i s k 
           *   t h a t   s o m e o n e   m a y   u s e   b o t h   t h e   o l d   a n d   t h e   n e w   a l l o w a n c e   b y   u n f o r t u n a t e 
           *   t r a n s a c t i o n   o r d e r i n g .   O n e   p o s s i b l e   s o l u t i o n   t o   m i t i g a t e   t h i s   r a c e 
           *   c o n d i t i o n   i s   t o   f i r s t   r e d u c e   t h e   s p e n d e r ' s   a l l o w a n c e   t o   0   a n d   s e t   t h e 
           *   d e s i r e d   v a l u e   a f t e r w a r d s : 
           *   h t t p s : / / g i t h u b . c o m / e t h e r e u m / E I P s / i s s u e s / 2 0 # i s s u e c o m m e n t - 2 6 3 5 2 4 7 2 9 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t . 
           * / 
         f u n c t i o n   a p p r o v e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   a m o u n t )   e x t e r n a l   r e t u r n s   ( b o o l ) ; 
 
         / * * 
           *   @ d e v   M o v e s   ` a m o u n t `   t o k e n s   f r o m   ` f r o m `   t o   ` t o `   u s i n g   t h e 
           *   a l l o w a n c e   m e c h a n i s m .   ` a m o u n t `   i s   t h e n   d e d u c t e d   f r o m   t h e   c a l l e r ' s 
           *   a l l o w a n c e . 
           * 
           *   R e t u r n s   a   b o o l e a n   v a l u e   i n d i c a t i n g   w h e t h e r   t h e   o p e r a t i o n   s u c c e e d e d . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t . 
           * / 
         f u n c t i o n   t r a n s f e r F r o m ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   e x t e r n a l   r e t u r n s   ( b o o l ) ; 
 
         / * * 
           *   @ d e v   E m i t t e d   w h e n   ` v a l u e `   t o k e n s   a r e   m o v e d   f r o m   o n e   a c c o u n t   ( ` f r o m ` )   t o 
           *   a n o t h e r   ( ` t o ` ) . 
           * 
           *   N o t e   t h a t   ` v a l u e `   m a y   b e   z e r o . 
           * / 
         e v e n t   T r a n s f e r ( a d d r e s s   i n d e x e d   f r o m ,   a d d r e s s   i n d e x e d   t o ,   u i n t 2 5 6   v a l u e ) ; 
 
         / * * 
           *   @ d e v   E m i t t e d   w h e n   t h e   a l l o w a n c e   o f   a   ` s p e n d e r `   f o r   a n   ` o w n e r `   i s   s e t   b y 
           *   a   c a l l   t o   { a p p r o v e } .   ` v a l u e `   i s   t h e   n e w   a l l o w a n c e . 
           * / 
         e v e n t   A p p r o v a l ( a d d r e s s   i n d e x e d   o w n e r ,   a d d r e s s   i n d e x e d   s p e n d e r ,   u i n t 2 5 6   v a l u e ) ; 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s - u p g r a d e a b l e / t o k e n / E R C 2 0 / e x t e n s i o n s / I E R C 2 0 M e t a d a t a U p g r a d e a b l e . s o l @ v 4 . 5 . 2 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   v 4 . 4 . 1   ( t o k e n / E R C 2 0 / e x t e n s i o n s / I E R C 2 0 M e t a d a t a . s o l ) 
 
 
 
 / * * 
   *   @ d e v   I n t e r f a c e   f o r   t h e   o p t i o n a l   m e t a d a t a   f u n c t i o n s   f r o m   t h e   E R C 2 0   s t a n d a r d . 
   * 
   *   _ A v a i l a b l e   s i n c e   v 4 . 1 . _ 
   * / 
 i n t e r f a c e   I E R C 2 0 M e t a d a t a U p g r a d e a b l e   i s   I E R C 2 0 U p g r a d e a b l e   { 
         / * * 
           *   @ d e v   R e t u r n s   t h e   n a m e   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   n a m e ( )   e x t e r n a l   v i e w   r e t u r n s   ( s t r i n g   m e m o r y ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   s y m b o l   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   s y m b o l ( )   e x t e r n a l   v i e w   r e t u r n s   ( s t r i n g   m e m o r y ) ; 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   d e c i m a l s   p l a c e s   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   d e c i m a l s ( )   e x t e r n a l   v i e w   r e t u r n s   ( u i n t 8 ) ; 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s - u p g r a d e a b l e / u t i l s / C o n t e x t U p g r a d e a b l e . s o l @ v 4 . 5 . 2 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   v 4 . 4 . 1   ( u t i l s / C o n t e x t . s o l ) 
 
 
 
 / * * 
   *   @ d e v   P r o v i d e s   i n f o r m a t i o n   a b o u t   t h e   c u r r e n t   e x e c u t i o n   c o n t e x t ,   i n c l u d i n g   t h e 
   *   s e n d e r   o f   t h e   t r a n s a c t i o n   a n d   i t s   d a t a .   W h i l e   t h e s e   a r e   g e n e r a l l y   a v a i l a b l e 
   *   v i a   m s g . s e n d e r   a n d   m s g . d a t a ,   t h e y   s h o u l d   n o t   b e   a c c e s s e d   i n   s u c h   a   d i r e c t 
   *   m a n n e r ,   s i n c e   w h e n   d e a l i n g   w i t h   m e t a - t r a n s a c t i o n s   t h e   a c c o u n t   s e n d i n g   a n d 
   *   p a y i n g   f o r   e x e c u t i o n   m a y   n o t   b e   t h e   a c t u a l   s e n d e r   ( a s   f a r   a s   a n   a p p l i c a t i o n 
   *   i s   c o n c e r n e d ) . 
   * 
   *   T h i s   c o n t r a c t   i s   o n l y   r e q u i r e d   f o r   i n t e r m e d i a t e ,   l i b r a r y - l i k e   c o n t r a c t s . 
   * / 
 a b s t r a c t   c o n t r a c t   C o n t e x t U p g r a d e a b l e   i s   I n i t i a l i z a b l e   { 
         f u n c t i o n   _ _ C o n t e x t _ i n i t ( )   i n t e r n a l   o n l y I n i t i a l i z i n g   { 
         } 
 
         f u n c t i o n   _ _ C o n t e x t _ i n i t _ u n c h a i n e d ( )   i n t e r n a l   o n l y I n i t i a l i z i n g   { 
         } 
         f u n c t i o n   _ m s g S e n d e r ( )   i n t e r n a l   v i e w   v i r t u a l   r e t u r n s   ( a d d r e s s )   { 
                 r e t u r n   m s g . s e n d e r ; 
         } 
 
         f u n c t i o n   _ m s g D a t a ( )   i n t e r n a l   v i e w   v i r t u a l   r e t u r n s   ( b y t e s   c a l l d a t a )   { 
                 r e t u r n   m s g . d a t a ; 
         } 
 
         / * * 
           *   @ d e v   T h i s   e m p t y   r e s e r v e d   s p a c e   i s   p u t   i n   p l a c e   t o   a l l o w   f u t u r e   v e r s i o n s   t o   a d d   n e w 
           *   v a r i a b l e s   w i t h o u t   s h i f t i n g   d o w n   s t o r a g e   i n   t h e   i n h e r i t a n c e   c h a i n . 
           *   S e e   h t t p s : / / d o c s . o p e n z e p p e l i n . c o m / c o n t r a c t s / 4 . x / u p g r a d e a b l e # s t o r a g e _ g a p s 
           * / 
         u i n t 2 5 6 [ 5 0 ]   p r i v a t e   _ _ g a p ; 
 } 
 
 
 / /   F i l e   @ o p e n z e p p e l i n / c o n t r a c t s - u p g r a d e a b l e / t o k e n / E R C 2 0 / E R C 2 0 U p g r a d e a b l e . s o l @ v 4 . 5 . 2 
 
 
 / /   O p e n Z e p p e l i n   C o n t r a c t s   ( l a s t   u p d a t e d   v 4 . 5 . 0 )   ( t o k e n / E R C 2 0 / E R C 2 0 . s o l ) 
 
 
 
 
 
 
 / * * 
   *   @ d e v   I m p l e m e n t a t i o n   o f   t h e   { I E R C 2 0 }   i n t e r f a c e . 
   * 
   *   T h i s   i m p l e m e n t a t i o n   i s   a g n o s t i c   t o   t h e   w a y   t o k e n s   a r e   c r e a t e d .   T h i s   m e a n s 
   *   t h a t   a   s u p p l y   m e c h a n i s m   h a s   t o   b e   a d d e d   i n   a   d e r i v e d   c o n t r a c t   u s i n g   { _ m i n t } . 
   *   F o r   a   g e n e r i c   m e c h a n i s m   s e e   { E R C 2 0 P r e s e t M i n t e r P a u s e r } . 
   * 
   *   T I P :   F o r   a   d e t a i l e d   w r i t e u p   s e e   o u r   g u i d e 
   *   h t t p s : / / f o r u m . z e p p e l i n . s o l u t i o n s / t / h o w - t o - i m p l e m e n t - e r c 2 0 - s u p p l y - m e c h a n i s m s / 2 2 6 [ H o w 
   *   t o   i m p l e m e n t   s u p p l y   m e c h a n i s m s ] . 
   * 
   *   W e   h a v e   f o l l o w e d   g e n e r a l   O p e n Z e p p e l i n   C o n t r a c t s   g u i d e l i n e s :   f u n c t i o n s   r e v e r t 
   *   i n s t e a d   r e t u r n i n g   ` f a l s e `   o n   f a i l u r e .   T h i s   b e h a v i o r   i s   n o n e t h e l e s s 
   *   c o n v e n t i o n a l   a n d   d o e s   n o t   c o n f l i c t   w i t h   t h e   e x p e c t a t i o n s   o f   E R C 2 0 
   *   a p p l i c a t i o n s . 
   * 
   *   A d d i t i o n a l l y ,   a n   { A p p r o v a l }   e v e n t   i s   e m i t t e d   o n   c a l l s   t o   { t r a n s f e r F r o m } . 
   *   T h i s   a l l o w s   a p p l i c a t i o n s   t o   r e c o n s t r u c t   t h e   a l l o w a n c e   f o r   a l l   a c c o u n t s   j u s t 
   *   b y   l i s t e n i n g   t o   s a i d   e v e n t s .   O t h e r   i m p l e m e n t a t i o n s   o f   t h e   E I P   m a y   n o t   e m i t 
   *   t h e s e   e v e n t s ,   a s   i t   i s n ' t   r e q u i r e d   b y   t h e   s p e c i f i c a t i o n . 
   * 
   *   F i n a l l y ,   t h e   n o n - s t a n d a r d   { d e c r e a s e A l l o w a n c e }   a n d   { i n c r e a s e A l l o w a n c e } 
   *   f u n c t i o n s   h a v e   b e e n   a d d e d   t o   m i t i g a t e   t h e   w e l l - k n o w n   i s s u e s   a r o u n d   s e t t i n g 
   *   a l l o w a n c e s .   S e e   { I E R C 2 0 - a p p r o v e } . 
   * / 
 c o n t r a c t   E R C 2 0 U p g r a d e a b l e   i s   I n i t i a l i z a b l e ,   C o n t e x t U p g r a d e a b l e ,   I E R C 2 0 U p g r a d e a b l e ,   I E R C 2 0 M e t a d a t a U p g r a d e a b l e   { 
         m a p p i n g ( a d d r e s s   = >   u i n t 2 5 6 )   p r i v a t e   _ b a l a n c e s ; 
 
         m a p p i n g ( a d d r e s s   = >   m a p p i n g ( a d d r e s s   = >   u i n t 2 5 6 ) )   p r i v a t e   _ a l l o w a n c e s ; 
 
         u i n t 2 5 6   p r i v a t e   _ t o t a l S u p p l y ; 
 
         s t r i n g   p r i v a t e   _ n a m e ; 
         s t r i n g   p r i v a t e   _ s y m b o l ; 
 
         / * * 
           *   @ d e v   S e t s   t h e   v a l u e s   f o r   { n a m e }   a n d   { s y m b o l } . 
           * 
           *   T h e   d e f a u l t   v a l u e   o f   { d e c i m a l s }   i s   1 8 .   T o   s e l e c t   a   d i f f e r e n t   v a l u e   f o r 
           *   { d e c i m a l s }   y o u   s h o u l d   o v e r l o a d   i t . 
           * 
           *   A l l   t w o   o f   t h e s e   v a l u e s   a r e   i m m u t a b l e :   t h e y   c a n   o n l y   b e   s e t   o n c e   d u r i n g 
           *   c o n s t r u c t i o n . 
           * / 
         f u n c t i o n   _ _ E R C 2 0 _ i n i t ( s t r i n g   m e m o r y   n a m e _ ,   s t r i n g   m e m o r y   s y m b o l _ )   i n t e r n a l   o n l y I n i t i a l i z i n g   { 
                 _ _ E R C 2 0 _ i n i t _ u n c h a i n e d ( n a m e _ ,   s y m b o l _ ) ; 
         } 
 
         f u n c t i o n   _ _ E R C 2 0 _ i n i t _ u n c h a i n e d ( s t r i n g   m e m o r y   n a m e _ ,   s t r i n g   m e m o r y   s y m b o l _ )   i n t e r n a l   o n l y I n i t i a l i z i n g   { 
                 _ n a m e   =   n a m e _ ; 
                 _ s y m b o l   =   s y m b o l _ ; 
         } 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   n a m e   o f   t h e   t o k e n . 
           * / 
         f u n c t i o n   n a m e ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( s t r i n g   m e m o r y )   { 
                 r e t u r n   _ n a m e ; 
         } 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   s y m b o l   o f   t h e   t o k e n ,   u s u a l l y   a   s h o r t e r   v e r s i o n   o f   t h e 
           *   n a m e . 
           * / 
         f u n c t i o n   s y m b o l ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( s t r i n g   m e m o r y )   { 
                 r e t u r n   _ s y m b o l ; 
         } 
 
         / * * 
           *   @ d e v   R e t u r n s   t h e   n u m b e r   o f   d e c i m a l s   u s e d   t o   g e t   i t s   u s e r   r e p r e s e n t a t i o n . 
           *   F o r   e x a m p l e ,   i f   ` d e c i m a l s `   e q u a l s   ` 2 ` ,   a   b a l a n c e   o f   ` 5 0 5 `   t o k e n s   s h o u l d 
           *   b e   d i s p l a y e d   t o   a   u s e r   a s   ` 5 . 0 5 `   ( ` 5 0 5   /   1 0   * *   2 ` ) . 
           * 
           *   T o k e n s   u s u a l l y   o p t   f o r   a   v a l u e   o f   1 8 ,   i m i t a t i n g   t h e   r e l a t i o n s h i p   b e t w e e n 
           *   E t h e r   a n d   W e i .   T h i s   i s   t h e   v a l u e   { E R C 2 0 }   u s e s ,   u n l e s s   t h i s   f u n c t i o n   i s 
           *   o v e r r i d d e n ; 
           * 
           *   N O T E :   T h i s   i n f o r m a t i o n   i s   o n l y   u s e d   f o r   _ d i s p l a y _   p u r p o s e s :   i t   i n 
           *   n o   w a y   a f f e c t s   a n y   o f   t h e   a r i t h m e t i c   o f   t h e   c o n t r a c t ,   i n c l u d i n g 
           *   { I E R C 2 0 - b a l a n c e O f }   a n d   { I E R C 2 0 - t r a n s f e r } . 
           * / 
         f u n c t i o n   d e c i m a l s ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 8 )   { 
                 r e t u r n   1 8 ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - t o t a l S u p p l y } . 
           * / 
         f u n c t i o n   t o t a l S u p p l y ( )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 2 5 6 )   { 
                 r e t u r n   _ t o t a l S u p p l y ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - b a l a n c e O f } . 
           * / 
         f u n c t i o n   b a l a n c e O f ( a d d r e s s   a c c o u n t )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 2 5 6 )   { 
                 r e t u r n   _ b a l a n c e s [ a c c o u n t ] ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - t r a n s f e r } . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` t o `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   t h e   c a l l e r   m u s t   h a v e   a   b a l a n c e   o f   a t   l e a s t   ` a m o u n t ` . 
           * / 
         f u n c t i o n   t r a n s f e r ( a d d r e s s   t o ,   u i n t 2 5 6   a m o u n t )   p u b l i c   v i r t u a l   o v e r r i d e   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 _ t r a n s f e r ( o w n e r ,   t o ,   a m o u n t ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - a l l o w a n c e } . 
           * / 
         f u n c t i o n   a l l o w a n c e ( a d d r e s s   o w n e r ,   a d d r e s s   s p e n d e r )   p u b l i c   v i e w   v i r t u a l   o v e r r i d e   r e t u r n s   ( u i n t 2 5 6 )   { 
                 r e t u r n   _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ] ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - a p p r o v e } . 
           * 
           *   N O T E :   I f   ` a m o u n t `   i s   t h e   m a x i m u m   ` u i n t 2 5 6 ` ,   t h e   a l l o w a n c e   i s   n o t   u p d a t e d   o n 
           *   ` t r a n s f e r F r o m ` .   T h i s   i s   s e m a n t i c a l l y   e q u i v a l e n t   t o   a n   i n f i n i t e   a p p r o v a l . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   a p p r o v e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   a m o u n t )   p u b l i c   v i r t u a l   o v e r r i d e   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 _ a p p r o v e ( o w n e r ,   s p e n d e r ,   a m o u n t ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   S e e   { I E R C 2 0 - t r a n s f e r F r o m } . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t   i n d i c a t i n g   t h e   u p d a t e d   a l l o w a n c e .   T h i s   i s   n o t 
           *   r e q u i r e d   b y   t h e   E I P .   S e e   t h e   n o t e   a t   t h e   b e g i n n i n g   o f   { E R C 2 0 } . 
           * 
           *   N O T E :   D o e s   n o t   u p d a t e   t h e   a l l o w a n c e   i f   t h e   c u r r e n t   a l l o w a n c e 
           *   i s   t h e   m a x i m u m   ` u i n t 2 5 6 ` . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` f r o m `   a n d   ` t o `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` f r o m `   m u s t   h a v e   a   b a l a n c e   o f   a t   l e a s t   ` a m o u n t ` . 
           *   -   t h e   c a l l e r   m u s t   h a v e   a l l o w a n c e   f o r   ` ` f r o m ` ` ' s   t o k e n s   o f   a t   l e a s t 
           *   ` a m o u n t ` . 
           * / 
         f u n c t i o n   t r a n s f e r F r o m ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   p u b l i c   v i r t u a l   o v e r r i d e   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   s p e n d e r   =   _ m s g S e n d e r ( ) ; 
                 _ s p e n d A l l o w a n c e ( f r o m ,   s p e n d e r ,   a m o u n t ) ; 
                 _ t r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   A t o m i c a l l y   i n c r e a s e s   t h e   a l l o w a n c e   g r a n t e d   t o   ` s p e n d e r `   b y   t h e   c a l l e r . 
           * 
           *   T h i s   i s   a n   a l t e r n a t i v e   t o   { a p p r o v e }   t h a t   c a n   b e   u s e d   a s   a   m i t i g a t i o n   f o r 
           *   p r o b l e m s   d e s c r i b e d   i n   { I E R C 2 0 - a p p r o v e } . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t   i n d i c a t i n g   t h e   u p d a t e d   a l l o w a n c e . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   i n c r e a s e A l l o w a n c e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   a d d e d V a l u e )   p u b l i c   v i r t u a l   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 _ a p p r o v e ( o w n e r ,   s p e n d e r ,   _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ]   +   a d d e d V a l u e ) ; 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   A t o m i c a l l y   d e c r e a s e s   t h e   a l l o w a n c e   g r a n t e d   t o   ` s p e n d e r `   b y   t h e   c a l l e r . 
           * 
           *   T h i s   i s   a n   a l t e r n a t i v e   t o   { a p p r o v e }   t h a t   c a n   b e   u s e d   a s   a   m i t i g a t i o n   f o r 
           *   p r o b l e m s   d e s c r i b e d   i n   { I E R C 2 0 - a p p r o v e } . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t   i n d i c a t i n g   t h e   u p d a t e d   a l l o w a n c e . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` s p e n d e r `   m u s t   h a v e   a l l o w a n c e   f o r   t h e   c a l l e r   o f   a t   l e a s t 
           *   ` s u b t r a c t e d V a l u e ` . 
           * / 
         f u n c t i o n   d e c r e a s e A l l o w a n c e ( a d d r e s s   s p e n d e r ,   u i n t 2 5 6   s u b t r a c t e d V a l u e )   p u b l i c   v i r t u a l   r e t u r n s   ( b o o l )   { 
                 a d d r e s s   o w n e r   =   _ m s g S e n d e r ( ) ; 
                 u i n t 2 5 6   c u r r e n t A l l o w a n c e   =   _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ] ; 
                 r e q u i r e ( c u r r e n t A l l o w a n c e   > =   s u b t r a c t e d V a l u e ,   " E R C 2 0 :   d e c r e a s e d   a l l o w a n c e   b e l o w   z e r o " ) ; 
                 u n c h e c k e d   { 
                         _ a p p r o v e ( o w n e r ,   s p e n d e r ,   c u r r e n t A l l o w a n c e   -   s u b t r a c t e d V a l u e ) ; 
                 } 
 
                 r e t u r n   t r u e ; 
         } 
 
         / * * 
           *   @ d e v   M o v e s   ` a m o u n t `   o f   t o k e n s   f r o m   ` s e n d e r `   t o   ` r e c i p i e n t ` . 
           * 
           *   T h i s   i n t e r n a l   f u n c t i o n   i s   e q u i v a l e n t   t o   { t r a n s f e r } ,   a n d   c a n   b e   u s e d   t o 
           *   e . g .   i m p l e m e n t   a u t o m a t i c   t o k e n   f e e s ,   s l a s h i n g   m e c h a n i s m s ,   e t c . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` f r o m `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` t o `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` f r o m `   m u s t   h a v e   a   b a l a n c e   o f   a t   l e a s t   ` a m o u n t ` . 
           * / 
         f u n c t i o n   _ t r a n s f e r ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( f r o m   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   t r a n s f e r   f r o m   t h e   z e r o   a d d r e s s " ) ; 
                 r e q u i r e ( t o   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   t r a n s f e r   t o   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ b e f o r e T o k e n T r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
 
                 u i n t 2 5 6   f r o m B a l a n c e   =   _ b a l a n c e s [ f r o m ] ; 
                 r e q u i r e ( f r o m B a l a n c e   > =   a m o u n t ,   " E R C 2 0 :   t r a n s f e r   a m o u n t   e x c e e d s   b a l a n c e " ) ; 
                 u n c h e c k e d   { 
                         _ b a l a n c e s [ f r o m ]   =   f r o m B a l a n c e   -   a m o u n t ; 
                 } 
                 _ b a l a n c e s [ t o ]   + =   a m o u n t ; 
 
                 e m i t   T r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
 
                 _ a f t e r T o k e n T r a n s f e r ( f r o m ,   t o ,   a m o u n t ) ; 
         } 
 
         / * *   @ d e v   C r e a t e s   ` a m o u n t `   t o k e n s   a n d   a s s i g n s   t h e m   t o   ` a c c o u n t ` ,   i n c r e a s i n g 
           *   t h e   t o t a l   s u p p l y . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t   w i t h   ` f r o m `   s e t   t o   t h e   z e r o   a d d r e s s . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` a c c o u n t `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   _ m i n t ( a d d r e s s   a c c o u n t ,   u i n t 2 5 6   a m o u n t )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( a c c o u n t   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   m i n t   t o   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ b e f o r e T o k e n T r a n s f e r ( a d d r e s s ( 0 ) ,   a c c o u n t ,   a m o u n t ) ; 
 
                 _ t o t a l S u p p l y   + =   a m o u n t ; 
                 _ b a l a n c e s [ a c c o u n t ]   + =   a m o u n t ; 
                 e m i t   T r a n s f e r ( a d d r e s s ( 0 ) ,   a c c o u n t ,   a m o u n t ) ; 
 
                 _ a f t e r T o k e n T r a n s f e r ( a d d r e s s ( 0 ) ,   a c c o u n t ,   a m o u n t ) ; 
         } 
 
         / * * 
           *   @ d e v   D e s t r o y s   ` a m o u n t `   t o k e n s   f r o m   ` a c c o u n t ` ,   r e d u c i n g   t h e 
           *   t o t a l   s u p p l y . 
           * 
           *   E m i t s   a   { T r a n s f e r }   e v e n t   w i t h   ` t o `   s e t   t o   t h e   z e r o   a d d r e s s . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` a c c o u n t `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` a c c o u n t `   m u s t   h a v e   a t   l e a s t   ` a m o u n t `   t o k e n s . 
           * / 
         f u n c t i o n   _ b u r n ( a d d r e s s   a c c o u n t ,   u i n t 2 5 6   a m o u n t )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( a c c o u n t   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   b u r n   f r o m   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ b e f o r e T o k e n T r a n s f e r ( a c c o u n t ,   a d d r e s s ( 0 ) ,   a m o u n t ) ; 
 
                 u i n t 2 5 6   a c c o u n t B a l a n c e   =   _ b a l a n c e s [ a c c o u n t ] ; 
                 r e q u i r e ( a c c o u n t B a l a n c e   > =   a m o u n t ,   " E R C 2 0 :   b u r n   a m o u n t   e x c e e d s   b a l a n c e " ) ; 
                 u n c h e c k e d   { 
                         _ b a l a n c e s [ a c c o u n t ]   =   a c c o u n t B a l a n c e   -   a m o u n t ; 
                 } 
                 _ t o t a l S u p p l y   - =   a m o u n t ; 
 
                 e m i t   T r a n s f e r ( a c c o u n t ,   a d d r e s s ( 0 ) ,   a m o u n t ) ; 
 
                 _ a f t e r T o k e n T r a n s f e r ( a c c o u n t ,   a d d r e s s ( 0 ) ,   a m o u n t ) ; 
         } 
 
         / * * 
           *   @ d e v   S e t s   ` a m o u n t `   a s   t h e   a l l o w a n c e   o f   ` s p e n d e r `   o v e r   t h e   ` o w n e r `   s   t o k e n s . 
           * 
           *   T h i s   i n t e r n a l   f u n c t i o n   i s   e q u i v a l e n t   t o   ` a p p r o v e ` ,   a n d   c a n   b e   u s e d   t o 
           *   e . g .   s e t   a u t o m a t i c   a l l o w a n c e s   f o r   c e r t a i n   s u b s y s t e m s ,   e t c . 
           * 
           *   E m i t s   a n   { A p p r o v a l }   e v e n t . 
           * 
           *   R e q u i r e m e n t s : 
           * 
           *   -   ` o w n e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           *   -   ` s p e n d e r `   c a n n o t   b e   t h e   z e r o   a d d r e s s . 
           * / 
         f u n c t i o n   _ a p p r o v e ( 
                 a d d r e s s   o w n e r , 
                 a d d r e s s   s p e n d e r , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { 
                 r e q u i r e ( o w n e r   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   a p p r o v e   f r o m   t h e   z e r o   a d d r e s s " ) ; 
                 r e q u i r e ( s p e n d e r   ! =   a d d r e s s ( 0 ) ,   " E R C 2 0 :   a p p r o v e   t o   t h e   z e r o   a d d r e s s " ) ; 
 
                 _ a l l o w a n c e s [ o w n e r ] [ s p e n d e r ]   =   a m o u n t ; 
                 e m i t   A p p r o v a l ( o w n e r ,   s p e n d e r ,   a m o u n t ) ; 
         } 
 
         / * * 
           *   @ d e v   S p e n d   ` a m o u n t `   f o r m   t h e   a l l o w a n c e   o f   ` o w n e r `   t o w a r d   ` s p e n d e r ` . 
           * 
           *   D o e s   n o t   u p d a t e   t h e   a l l o w a n c e   a m o u n t   i n   c a s e   o f   i n f i n i t e   a l l o w a n c e . 
           *   R e v e r t   i f   n o t   e n o u g h   a l l o w a n c e   i s   a v a i l a b l e . 
           * 
           *   M i g h t   e m i t   a n   { A p p r o v a l }   e v e n t . 
           * / 
         f u n c t i o n   _ s p e n d A l l o w a n c e ( 
                 a d d r e s s   o w n e r , 
                 a d d r e s s   s p e n d e r , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { 
                 u i n t 2 5 6   c u r r e n t A l l o w a n c e   =   a l l o w a n c e ( o w n e r ,   s p e n d e r ) ; 
                 i f   ( c u r r e n t A l l o w a n c e   ! =   t y p e ( u i n t 2 5 6 ) . m a x )   { 
                         r e q u i r e ( c u r r e n t A l l o w a n c e   > =   a m o u n t ,   " E R C 2 0 :   i n s u f f i c i e n t   a l l o w a n c e " ) ; 
                         u n c h e c k e d   { 
                                 _ a p p r o v e ( o w n e r ,   s p e n d e r ,   c u r r e n t A l l o w a n c e   -   a m o u n t ) ; 
                         } 
                 } 
         } 
 
         / * * 
           *   @ d e v   H o o k   t h a t   i s   c a l l e d   b e f o r e   a n y   t r a n s f e r   o f   t o k e n s .   T h i s   i n c l u d e s 
           *   m i n t i n g   a n d   b u r n i n g . 
           * 
           *   C a l l i n g   c o n d i t i o n s : 
           * 
           *   -   w h e n   ` f r o m `   a n d   ` t o `   a r e   b o t h   n o n - z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s 
           *   w i l l   b e   t r a n s f e r r e d   t o   ` t o ` . 
           *   -   w h e n   ` f r o m `   i s   z e r o ,   ` a m o u n t `   t o k e n s   w i l l   b e   m i n t e d   f o r   ` t o ` . 
           *   -   w h e n   ` t o `   i s   z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s   w i l l   b e   b u r n e d . 
           *   -   ` f r o m `   a n d   ` t o `   a r e   n e v e r   b o t h   z e r o . 
           * 
           *   T o   l e a r n   m o r e   a b o u t   h o o k s ,   h e a d   t o   x r e f : R O O T : e x t e n d i n g - c o n t r a c t s . a d o c # u s i n g - h o o k s [ U s i n g   H o o k s ] . 
           * / 
         f u n c t i o n   _ b e f o r e T o k e n T r a n s f e r ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { } 
 
         / * * 
           *   @ d e v   H o o k   t h a t   i s   c a l l e d   a f t e r   a n y   t r a n s f e r   o f   t o k e n s .   T h i s   i n c l u d e s 
           *   m i n t i n g   a n d   b u r n i n g . 
           * 
           *   C a l l i n g   c o n d i t i o n s : 
           * 
           *   -   w h e n   ` f r o m `   a n d   ` t o `   a r e   b o t h   n o n - z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s 
           *   h a s   b e e n   t r a n s f e r r e d   t o   ` t o ` . 
           *   -   w h e n   ` f r o m `   i s   z e r o ,   ` a m o u n t `   t o k e n s   h a v e   b e e n   m i n t e d   f o r   ` t o ` . 
           *   -   w h e n   ` t o `   i s   z e r o ,   ` a m o u n t `   o f   ` ` f r o m ` ` ' s   t o k e n s   h a v e   b e e n   b u r n e d . 
           *   -   ` f r o m `   a n d   ` t o `   a r e   n e v e r   b o t h   z e r o . 
           * 
           *   T o   l e a r n   m o r e   a b o u t   h o o k s ,   h e a d   t o   x r e f : R O O T : e x t e n d i n g - c o n t r a c t s . a d o c # u s i n g - h o o k s [ U s i n g   H o o k s ] . 
           * / 
         f u n c t i o n   _ a f t e r T o k e n T r a n s f e r ( 
                 a d d r e s s   f r o m , 
                 a d d r e s s   t o , 
                 u i n t 2 5 6   a m o u n t 
         )   i n t e r n a l   v i r t u a l   { } 
 
         / * * 
           *   @ d e v   T h i s   e m p t y   r e s e r v e d   s p a c e   i s   p u t   i n   p l a c e   t o   a l l o w   f u t u r e   v e r s i o n s   t o   a d d   n e w 
           *   v a r i a b l e s   w i t h o u t   s h i f t i n g   d o w n   s t o r a g e   i n   t h e   i n h e r i t a n c e   c h a i n . 
           *   S e e   h t t p s : / / d o c s . o p e n z e p p e l i n . c o m / c o n t r a c t s / 4 . x / u p g r a d e a b l e # s t o r a g e _ g a p s 
           * / 
         u i n t 2 5 6 [ 4 5 ]   p r i v a t e   _ _ g a p ; 
 } 
 
 
 / /   F i l e   c o n t r a c t s / G a t h e r i n g T o k e n . s o l 
 
  
  
 / /   S p e c i f i e s   t h e   v e r s i o n   o f   S o l i d i t y ,   u s i n g   s e m a n t i c   v e r s i o n i n g .  
 / /   L e a r n   m o r e :   h t t p s : / / s o l i d i t y . r e a d t h e d o c s . i o / e n / v 0 . 5 . 1 0 / l a y o u t - o f - s o u r c e - f i l e s . h t m l # p r a g m a  
  
 p r a g m a   a b i c o d e r   v 2 ;  
 / /   D e f i n e s   a   c o n t r a c t   n a m e d   ` H e l l o W o r l d ` .  
 / /   A   c o n t r a c t   i s   a   c o l l e c t i o n   o f   f u n c t i o n s   a n d   d a t a   ( i t s   s t a t e ) .   O n c e   d e p l o y e d ,   a   c o n t r a c t   r e s i d e s   a t   a   s p e c i f i c   a d d r e s s   o n   t h e   E t h e r e u m   b l o c k c h a i n .   L e a r n   m o r e :   h t t p s : / / s o l i d i t y . r e a d t h e d o c s . i o / e n / v 0 . 5 . 1 0 / s t r u c t u r e - o f - a - c o n t r a c t . h t m l  
 c o n t r a c t   G a t h e r i n g T o k e n   i s   I n i t i a l i z a b l e ,   E R C 2 0 U p g r a d e a b l e   {  
  
     u i n t   d o c A w a r d ;  
     u i n t   v o t e A w a r d ;  
     u i n t   p a s s T h r e s h o l d ;  
     u i n t   p u b l i c   n u m D o c s ;  
  
     f u n c t i o n   i n i t i a l i z e ( )   i n i t i a l i z e r   p u b l i c   {  
         _ _ E R C 2 0 _ i n i t ( " O n   t h e   B l o c k   G a t h e r i n g " ,   " g O T B " ) ;  
         / /   M i n t   1 0 0   t o k e n s   t o   m s g . s e n d e r  
         _ m i n t ( m s g . s e n d e r ,   1 0 0   *   1 0 * * u i n t ( d e c i m a l s ( ) ) ) ;  
  
         d o c A w a r d   =   1 0 0 ;  
         v o t e A w a r d   =   5 ;  
         p a s s T h r e s h o l d   =   5 0 ;   / /   %  
         n u m D o c s   =   0 ;  
     }  
  
     r e c e i v e   ( )   e x t e r n a l   p a y a b l e   {  
     }  
  
 / /     f a l l b a c k ( )   e x t e r n a l   p a y a b l e   {  
 / /     }  
  
     s t r u c t   V o t e   {  
         a d d r e s s   v o t e r A d d r e s s ;  
         u i n t   w e i g h t ;  
         u i n t 8   v o t e ;   / /   1   = =   a p p r o v e ,   2   = =   r e j e c t ,   3   = =   a b s t a i n  
     }  
  
     s t r u c t   D o c   {  
         a d d r e s s   s u b m i t t e r ;   / /   a d d r e s s   o f   u s e r   w h o   a d d e d   t h e   d o c  
         u i n t 2 5 6   t i m e s t a m p ;   / /   c r e a t e d A t  
         s t r i n g   d o c U i d ;   / /   u i d   o f   t h e   d o c  
         u i n t 8   d o c T y p e ;   / /   1   = =   d o c ,   2   = =   s h e e t ,   3   = =   s l i d e  
         b o o l   a p p r o v e d ;   / /   p a s s e d   v o t e  
         u i n t 2 5 6   t o t a l V o t e s C o u n t ;   / /   v o t e s   c o u n t   f o r   t h i s   d o c  
         u i n t 2 5 6   t o t a l A p p r o v e V o t e s W e i g h t ;   / /   a p p r o v e   v o t e s   w e i g h t   f o r   t h i s   d o c  
         u i n t 2 5 6   t o t a l R e j e c t V o t e s W e i g h t ;   / /   r e j e c t   v o t e s   w e i g h t   f o r   t h i s   d o c  
         u i n t 2 5 6   t o t a l A b s t a i n V o t e s W e i g h t ;   / /   a b s t a i n   v o t e s   w e i g h t   f o r   t h i s   d o c  
         m a p p i n g ( u i n t 2 5 6   = >   V o t e )   v o t e s ;  
     }  
  
 / /     D o c [ ]   p u b l i c   d o c s ;  
     m a p p i n g   ( u i n t   = >   D o c )   p u b l i c   d o c s ;  
  
     e v e n t   D o c A d d e d ( u i n t   d o c I d ) ;  
     e v e n t   D o c A p p r o v e d ( u i n t   d o c I d ) ;  
  
     f u n c t i o n   a d d D o c ( s t r i n g   m e m o r y   d o c U i d ,   u i n t 8   d o c T y p e )   e x t e r n a l   r e t u r n s   ( u i n t )   {  
         b o o l   d o c E x i s t s   =   f a l s e ;  
         f o r   ( u i n t   i ;   i   <   n u m D o c s ;   i + + )   {  
             i f   ( k e c c a k 2 5 6 ( b y t e s ( d o c s [ i ] . d o c U i d ) )   = =   k e c c a k 2 5 6 ( b y t e s ( d o c U i d ) )   & &   d o c s [ i ] . d o c T y p e   = =   d o c T y p e )   {  
                 d o c E x i s t s   =   t r u e ;  
                 b r e a k ;  
             }  
         }  
         r e q u i r e ( d o c E x i s t s   = =   f a l s e ,   " D o c   e x i s t s   a l r e a d y . " ) ;  
  
         n u m D o c s   + =   1 ;  
         D o c   s t o r a g e   d o c   =   d o c s [ n u m D o c s ] ;  
         d o c . s u b m i t t e r   =   m s g . s e n d e r ;  
         d o c . t i m e s t a m p   =   b l o c k . t i m e s t a m p ;  
         d o c . d o c U i d   =   d o c U i d ;  
         d o c . d o c T y p e   =   d o c T y p e ;  
         d o c . a p p r o v e d   =   f a l s e ;  
         d o c . t o t a l V o t e s C o u n t   =   0 ;  
         d o c . t o t a l A p p r o v e V o t e s W e i g h t   =   0 ;  
  
         e m i t   D o c A d d e d ( n u m D o c s ) ;  
  
         r e t u r n   n u m D o c s ;  
     }  
  
     f u n c t i o n   v o t e O n D o c ( u i n t   d o c I d ,   u i n t 8   v o t e )   e x t e r n a l   r e t u r n s   ( b o o l )   {  
         r e q u i r e ( b a l a n c e O f ( m s g . s e n d e r )   >   0 ,   " N o t   p a r t   o f   t h i s   g a t h e r i n g . " ) ;  
         r e q u i r e ( d o c I d   <   n u m D o c s ,   " D o c   d o e s n ' t   e x i s t . " ) ;  
  
         b o o l   v o t e d A l r e a d y   =   f a l s e ;  
         D o c   s t o r a g e   d o c   =   d o c s [ d o c I d ] ;  
  
         / /   C h e c k   i f   t h e   u s e r   h a s   v o t e d   a l r e a d y  
         f o r   ( u i n t   j ;   j   <   d o c . t o t a l V o t e s C o u n t ;   j + + )   {  
             i f   ( d o c . v o t e s [ j ] . v o t e r A d d r e s s   = =   m s g . s e n d e r )   {  
                 v o t e d A l r e a d y   =   t r u e ;  
                 b r e a k ;  
             }  
         }  
         r e q u i r e ( v o t e d A l r e a d y   = =   f a l s e ,   " V o t e d   a l r e a d y . " ) ;  
  
         / /   A d d   v o t e   t o   d o c   o b j e c t  
         d o c . v o t e s [ d o c . t o t a l V o t e s C o u n t ]   =   V o t e ( {  
             v o t e r A d d r e s s :   m s g . s e n d e r ,  
             w e i g h t :   b a l a n c e O f ( m s g . s e n d e r ) ,  
             v o t e :   v o t e  
         } ) ;  
         d o c . t o t a l V o t e s C o u n t + + ;  
  
         / /   I f   t h e   v o t e   i s   a p p r o v e   - >   c h e c k   i f   i t   p a s s e s   a p p r o v a l   t h r e s h o l d   ( 5 0 %   o f   t o t a l S u p p l y )  
         i f   ( v o t e   = =   1 )   {  
             d o c . t o t a l A p p r o v e V o t e s W e i g h t   + =   b a l a n c e O f ( m s g . s e n d e r ) ;  
             u i n t 2 5 6   t h r e s h o l d   =   t o t a l S u p p l y ( )   /   ( 1 0 0   /   p a s s T h r e s h o l d ) ;  
             i f   ( d o c . t o t a l A p p r o v e V o t e s W e i g h t   >   t h r e s h o l d )   {  
                 d o c . a p p r o v e d   =   t r u e ;  
  
                 / /   R e w a r d   s u b m i t t e r   w i t h   a w a r d   t o k e n s  
                 _ m i n t ( d o c . s u b m i t t e r ,   d o c A w a r d   *   1 0 * * u i n t ( d e c i m a l s ( ) ) ) ;  
  
                 e m i t   D o c A p p r o v e d ( d o c I d ) ;  
             }  
         }   e l s e   i f   ( v o t e   = =   2 )   {  
             d o c . t o t a l R e j e c t V o t e s W e i g h t   + =   b a l a n c e O f ( m s g . s e n d e r ) ;  
         }   e l s e   i f   ( v o t e   = =   3 )   {  
             d o c . t o t a l A b s t a i n V o t e s W e i g h t   + =   b a l a n c e O f ( m s g . s e n d e r ) ;  
         }  
  
         / /   R e w a r d   v o t e r   w i t h   a w a r d   t o k e n s  
         _ m i n t ( m s g . s e n d e r ,   v o t e A w a r d   *   1 0 * * u i n t ( d e c i m a l s ( ) ) ) ;  
  
         r e t u r n   t r u e ;  
     }  
  
     f u n c t i o n   d o c s T o V o t e O n ( )   p u b l i c   v i e w   r e t u r n s   ( u i n t 2 5 6 [ ]   m e m o r y )   {  
         u i n t   n u m D o c s T o V o t e O n   =   0 ;  
         f o r   ( u i n t   i ;   i   <   n u m D o c s ;   i + + )   {  
             i f   ( d o c s [ i ] . a p p r o v e d   = =   f a l s e )   {  
                 n u m D o c s T o V o t e O n   + =   1 ;  
             }  
         }  
  
         u i n t 2 5 6 [ ]   m e m o r y   d o c s T o V o t e O n A r r   =   n e w   u i n t 2 5 6 [ ] ( n u m D o c s T o V o t e O n ) ;  
         u i n t   v o t e D o c I d x   =   0 ;  
         f o r   ( u i n t   i ;   i   <   n u m D o c s ;   i + + )   {  
             i f   ( d o c s [ i ] . a p p r o v e d   = =   f a l s e )   {  
                 d o c s T o V o t e O n A r r [ v o t e D o c I d x ]   =   i ;  
                 v o t e D o c I d x   + =   1 ;  
             }  
         }  
  
         r e t u r n   d o c s T o V o t e O n A r r ;  
     }  
  
     / * f u n c t i o n   a p p r o v e S p e n d ( u i n t 2 5 6   a m o u n t )   e x t e r n a l   {  
         a d d r e s s   t i p T o k e n A d d r e s s   =   0 x 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 ;  
  
         I E R C 2 0   t i p T o k e n I n s t a n c e   =   I E R C 2 0 ( t i p T o k e n A d d r e s s ) ;  
         b o o l   s u c c e s s   =   t i p T o k e n I n s t a n c e . a p p r o v e ( m s g . s e n d e r ,   a m o u n t ) ;  
         / /   t i p T o k e n I n s t a n c e . a l l o w a n c e ( m s g . s e n d e r ,   a d d r e s s ( t h i s ) ) ;  
  
         r e q u i r e ( s u c c e s s ,   " A p p r o v a l   f a i l e d " ) ;  
  
         r e t u r n   t r u e ;  
     }  
  
     f u n c t i o n   t i p D o c ( u i n t   d o c I d ,   u i n t 2 5 6   a m o u n t )   e x t e r n a l   {  
         a d d r e s s   t i p T o k e n A d d r e s s   =   0 x E e e e e E e e e E e E e e E e E e E e e E E E e e e e E e e e e e e e E E e E ;  
  
         I E R C 2 0   t i p T o k e n I n s t a n c e   =   I E R C 2 0 ( t i p T o k e n A d d r e s s ) ;  
         r e q u i r e ( t i p T o k e n I n s t a n c e . b a l a n c e O f ( m s g . s e n d e r )   > =   a m o u n t   ,   " Y o u r   b a l a n c e   i s   t o o   l o w "   ) ;  
         b o o l   s u c c e s s   =   t i p T o k e n I n s t a n c e . t r a n s f e r F r o m ( m s g . s e n d e r ,   a d d r e s s ( t h i s ) ,   a m o u n t ) ;  
  
         r e q u i r e ( s u c c e s s ,   " T r a n s f e r   f a i l e d " ) ;  
  
         r e t u r n   t r u e ;  
     }  
  
     f u n c t i o n   c h e c k A p p r o v a l ( )   e x t e r n a l   {  
         a d d r e s s   t i p T o k e n A d d r e s s   =   0 x 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 ;  
  
         I E R C 2 0   t i p T o k e n I n s t a n c e   =   I E R C 2 0 ( t i p T o k e n A d d r e s s ) ;  
         u i n t 2 5 6   a l l o w a n c e   =   t i p T o k e n I n s t a n c e . a l l o w a n c e ( m s g . s e n d e r ,   a d d r e s s ( t h i s ) ) ;  
  
         r e t u r n   a l l o w a n c e ;  
     } * /  
 } 
 