(defun my-mapcar(fun l1 l2)
  (cond
   ;mapcar only applies fun until the end of either l1 or l2...
   ( (null l1) nil) ;if first list is done
   ( (null l2) nil )  ;else it will check this, if second list is done!
   ( t
     (append ;can't use cons!
      (list (funcall fun (car l1) (car l2) )) (my-mapcar fun (cdr l1) (cdr l2) )  ;do the function the first 1+1, then pass (+)(23)(23)... 
      ;funcall calls the upon the function 'fun' which is passed in as a 'word'
      ) ;append()
   ); true
   );
) ;test using: (my-mapcar '+ '(1 2 3) '(1 2 3) )

 


(defun rdouble (y)
  (cond
   ( (null y) nil )
   ( (numberp y ) (append (list y) (list y) ) )
   ( (not (listp y ) ) nil) ;we put this at the bottom because it doesn checking from top to bottom. we have to have numberp first because numberb != list
   ( t
     (cond
      ( (listp (car y) ) ; Car returns number if by itself or a LISTP if (2 3)
	(append (list (rdouble (car y) ) ) (rdouble (cdr y) ) ) ) ;case that it's a (2 3) w/in (1 (2 3) 4) s.t. we make sure it's a type list
      (t 
       (append
	    ( rdouble (car y) ) ( rdouble (cdr y) ) ;cdr returns a list...
	    )
       )
      );cond()
    )   
  ) ;cond()
) ;rdouble


;if not a list it's just a single number, return 1 1 else (car y) (cdr y)...


(defun double-recursive(y)
		 (cond
		   (  (not (listp y) ) nil ) ;if y is not a list
		   (  (null y)  nil ) ;if we're done recursing s.t. x is nil
		   ( t
		    (append 
			 (append (list (car y) ) (list (car y) )  ) ;append b/c cons gives y.y
			 (double-recursive (cdr y) ) ;recurse and do for the rest of the list
		     ) ;append ( appended beginning + recurse )
		    ); true
		   );cond()
) ;double recursion()

(defun double-iterative(y)

  (cond
   ( (not (listp y) ) nil )
   ( t
      (do (
	    ;(iterator 1 (+ iterator 1) )
             (rest_list y (rest rest_list) )
             
	     (new_list nil
	        (append new_list
     	 	  (append (list (first rest_list) ) (list (first rest_list) ) )
	           ) ;append()
	      ) ;new_list
	   ) ;do() variables
	  ( (null rest_list) new_list ) ;return value after the do is done!
      ) ;do()
     ); t()
   )
  ) ;double iterative()

(defun double-mapcar(y)
  (cond
   ( (not (listp y) ) nil)
   (t
    (apply #'append   ;This appends all the lists w/in the list ( 1 1 2 2 3 3 )
	   (mapcar 'append ;since it's a list within a list, we can append each 'list' to the other 'list'
		   ; ( (1 1) (2 2) (3 3) ) ->lists w/in list
		   (mapcar 'list y) (mapcar 'list y) ;mapcar 'list y = ( (1) (2) (3) ) , makes each element a list
	   )
    ) ;apply
   );t()
  );cond()
) ;double-mapcar()

;Alternative way of listing...
; (apply 'mapcar (cons 'list (list '(1 2) '(1 2) ) ) )
;cons 'list (list '(1 2) '(1 2) -> (list (1 2) (1 2))
;When apply mapcar sees that, it will do mapcar 'list (1 2) (1 2) which is listing each element together (1 1) (2 2)
;since we're apply 'mapcar to each element ('list (1) (1) ) like that....


	  

               
     
 
