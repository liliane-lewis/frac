;; =======   FUNÇÕES PRÉ-DEFINIDAS DO PACOTE 2htdp/image.rkt    =======  

;; triangle: Number String String -> Image
;; Dados o tamanho do lado, o tipo de preenchimento ("solid" ou "outline")
;; e a cor, desenha o triângulo equilátero correspondente.
;; Exemplos:
;; (triangle 20 "solid" "red") = .
;; (triangle 30 "outline" "darkgreen") = .

;; empty-scene: Number Number -> Scene
;; Dados a largura e altura de uma cena, gera a cena correspondente.
;; Exemplo:
;; (empty-scene 50 30) = .

;; place-image: Image Number Number Scene -> Scene
;; Dados uma imagem, as coordenadas x e y e uma cena, coloca esta imagem na cena,
;; com o centro nestas coordenadas.
;; Exemplo:
;; (place-image (triangle 20 "solid" "red") 20 20 (empty-scene 50 30)) = .

;; ========================================================================== 

;; Para TODAS as funções recursivas,
;; A) diga se a recursão é estrutural ou generativa,
;; B) faça o "modelo de solução" através de comentários nos casos do seu programa,
;; seguindo o padrão a seguir:

;; MODELO DE SOLUÇÃO:

;; Se <problema trivial> então <solução do problema trivial>
;; Se <problema complexo> então
;;           <combinar soluções>
;;                 <solucionar subproblema 1> <gerar subproblema 1>
;;                            ...                      ...
;;                 <solucionar subproblema n> <gerar subproblema n>

;; Lembre que, dependendo do problema, podem existir mais de um caso trivial, bem
;; como mais de um caso complexo.

;; C) Argumente sobre a terminação da função.

;; ========================================================================== 
;; 1) Construa uma função que, dado o tamanho do lado e uma cor, desenha um triângulo vazado desta cor, com este tamanho de lado.
 

;; desenha-triangulo : Number String ->  Image
;; Obj.: Dado o tamanho do lado e uma cor, desenha um triângulo vazado desta cor, com este tamanho de lado
;;
;; Exemplos: ...
;;(desenha-triangulo 40 "tan") = .
;; (desenha-triangulo 40 "red") = .
(define (desenha-triangulo lado cor)
  (triangle lado "outline" cor)
)

(desenha-triangulo 40 "tan")
(desenha-triangulo 40 "red")

;; ========================================================================== 

;; 2) Desenvolva uma função que dado um número, verifica se este é muito pequeno (escolha um critério para "muito pequeno").
;; Escolher critério o que é pequeno ou grande
;; muito-pequeno? : Número  ->  Boolean
;; Obj.: Dado um número, verifica se este é muito pequeno
;; Exemplos:
;; (muito-pequeno? 11) = #false
;; (muito-pequeno? 9) = #true
(define (muito-pequeno? num)
;; Número pequeno: 10
  (cond
    [(> num 10) false]
    [else true]

   )
)

  
;; ========================================================================== 

;; 3) Construa uma função que, dados o tamanho do lado e uma cor, desenha um triângulo de Sierpinski desta cor
;; cujo lado do triângulo externo é o lado passado como argumento. 

;; O triângulo de Sierpinski é construído dividindo-se cada triângulo em 3, e desenhado recursivamente um
;; triângulo de Sierpinski dentro de cada um destes triângulos, conforme os desenhos a seguir.
;; Se o lado passado como argumento tiver dimensões muito pequenas, somente desenha um triângulo.


;.  . .  .  ... .

;; sierpinski : Number String ->  Image
;; Obj.: Dados o tamanho do lado e uma cor, desenha um triângulo de Sierpinski desta cor
;; cujo lado do triângulo externo é o lado passado como argumento. 
;; Se o lado passado como argumento tiver dimensões muito pequenas, somente desenha um triângulo.
;; Exemplos:

;; (sierpinski 400 "red")  = .
;; (sierpinski 200 "blue")  = .
;; A) Recursão estrutural
(define (sierpinski lado cor)
  (cond
  ;; Se <problema trivial> então <solução do problema trivial>
    [(muito-pequeno? lado) (desenha-triangulo lado cor)]
;; Se <problema complexo> então
;;           <combinar soluções>
;;                 <solucionar subproblema 1> <gerar subproblema 1>
;; [else (desenha-triangulo 40 "blue")]
;; Tres problemas menores
;;   <solucionar subproblema n> <gerar subproblema n>
    [else
      (above (sierpinski (/ lado 3) cor)
       (beside
            (sierpinski (/ lado 3) cor)
            (sierpinski (/ lado 3) cor)
        )
     )
      ]

;;   


  )
)
;(sierpinski 400 "red")
;(sierpinski 200 "blue")
