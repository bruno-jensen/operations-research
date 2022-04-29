* E-Commerce marketplace logistic operation.
* (https://github.com/bruno-jensen)

$onText
This is a toy model, created to explore the model with a very small example.

It has:
- 3 Fulfillment Centers
- 5 different products
- 2 federal states (or geographical divisions)
- 5 days of planning horizon

$offText

option OPTCR = 0.0, Solprint = off, LIMROW = 10, LIMCOL = 10;

Sets
  p produto /1*5/
  i centros de distribuicao /1*3/
  e estados /1*2/
  t dia /1*5/;
  alias(i,j)

Parameters

 MK(p)
 /
  1      1.0
  2      1.0
  3      1.0
  4      1.0
  5      1.0
 /

 Table
 receita(p,e)
           1     2
  1      100   100
  2      100   100
  3      100   100
  4      100   100
  5      100   100;

 Table
 d(i,p) estoque de seguranca do produto p no armazem i
           1     2       3       4       5
  1      1.0   1.0     1.0     1.0     1.0
  2      1.0   1.0     1.0     1.0     1.0
  3      1.0   1.0     1.0     1.0     1.0;

 Table
 demanda(p,e,t) demanda do produto p no estado e no dia t
         1.1    1.2      1.3     1.4     1.5     2.1     2.2     2.3     2.4     2.5
  1      10     10       10      10      10      10      10      10      10      10
  2      10     10       10      10      10      10      10      10      10      10
  3      10     10       10      10      10      10      10      10      10      10
  4      10     10       10      10      10      10      10      10      10      10
  5      10     10       10      10      10      10      10      10      10      10;

 Table
 preco(p,e,t) preco de venda do produto p no estado e
        1.1    1.2      1.3     1.4     1.5     2.1     2.2     2.3     2.4     2.5
  1      1      1        1       1       1       1       1       1       1       1
  2      1      1        1       1       1       1       1       1       1       1
  3      1      1        1       1       1       1       1       1       1       1
  4      1      1        1       1       1       1       1       1       1       1
  5      1      1        1       1       1       1       1       1       1       1;

 Table
 is(p,i) estoque inicial do produto p em i
         1       2       3
  1     10      10      10
  2     10      10      10
  3     10      10      10
  4     10      10      10
  5     10      10      10;

 Table
 tlm(i,e,p) tempo de entrega a partir de i no estado e
        1.1    1.2      1.3     1.4     1.5     2.1     2.2     2.3     2.4     2.5
  1      1      1        1       1       1       1       1       1       1       1
  2      1      1        1       1       1       1       1       1       1       1
  3      1      1        1       1       1       1       1       1       1       1;

 Table
 cst(i,p) custo de entrega à partir de i no estado e
         1       2       3       4       5
  1      1       1       1       1       1
  2      1       1       1       1       1
  3      1       1       1       1       1;

 Table
 clm(i,e,p) custo de entrega à partir de i no estado e para o produto p
         1.1    1.2      1.3     1.4     1.5     2.1     2.2     2.3     2.4     2.5
  1       1      1        1       1       1       1       1       1       1       1
  2       1      1        1       1       1       1       1       1       1       1
  3       1      1        1       1       1       1       1       1       1       1;

 Table
 cfc(i,j,p) custo em reais por unidade para transportar de i para j para o produto p
         1.1    1.2      1.3     1.4     1.5     2.1     2.2     2.3     2.4     2.5     3.1     3.2     3.3     3.4     3.5
  1       1      1        1       1       1       1       1       1       1       1       1       1       1       1       1
  2       1      1        1       1       1       1       1       1       1       1       1       1       1       1       1
  3       1      1        1       1       1       1       1       1       1       1       1       1       1       1       1;

 Table
 tfc(i,j,p) tempo em dias de transporte entre i e j
         1.1    1.2      1.3     1.4     1.5     2.1     2.2     2.3     2.4     2.5     3.1     3.2     3.3     3.4     3.5
  1       0      0        0       0       0       0       0       0       0       0       0       0       0       0       0
  2       0      0        0       0       0       0       0       0       0       0       0       0       0       0       0
  3       0      0        0       0       0       0       0       0       0       0       0       0       0       0       0;

 Table
 cis(p,i) custo de receber o produto p em i
         1       2
  1      1       1
  2      1       1;

 Table
 ois(p,i,t) quantidade do produto p enviada para o centro de distribuicao i no dia t
         1.1     1.2      1.3     1.4     1.5     2.1     2.2     2.3     2.4     2.5
  1       10      10       10      10      10      10      10      10      10      10
  2       10      10       10      10      10      10      10      10      10      10;

 Variables

 z                      Total cost,
 qs(p,j,i,t)            quantidade transportada de i para j no dia t,
 qe(p,j,i,t)            quantidade transportada de i para j no dia t,
 v(p,i,e,t)             quantidade de p entregue no estado e a partir de i no dia t,
 saldo(i,p,t)           quantidade de p disponível em i ao final do dia t,
 s(i,p,t)               quantidade de p entregue em i no dia t;

 Integer variables      qs, qe, v, saldo, s;

 Equations
 OBJFUN                 Funcao objetivo
 DEMANDAPRODUTOS(p,e,t) Atendimento a demanda do produto p no dia t
 ESTOQUE(i,p,t)         Balanco de estoques do produto p no armazem i no dia t
 ESTOQUEINICIAL(i,p,t)  Balanco de estoques do produto p no armazem i no primeiro dia
 SEGURANCA(i,p,t)       Estoque de seguranca do produto p no dia t
 BALANCO(p,i,j,t)       Balanco de transporte entre os FCs;

 OBJFUN..

         Z =e= sum(p, sum(e, sum(t, receita(p,e) * demanda(p,e,t)))) - sum(p, sum(i, sum(e, sum(t, clm(i,e,p)*v(p,i,e,t))))) - sum(i, sum(j, sum(p, cfc(i,j,p) * sum(t, qs(p,i,j,t))))) - sum(i, sum(p, sum(t, cst(i,p)*saldo(i,p,t)))) - sum(p, sum(i, sum(t, CIS(p,i) * s(i,p,t))));

 DEMANDAPRODUTOS(p,e,t)..

         sum(i, v(p,i,e,t)) =e= demanda(p,e,t);

 ESTOQUE(i,p,t) $ (ord(t) > 1)..

         saldo(i,p,t) =e= sum(j, qe(p,j,i,t)) - sum(j, qs(p,i,j,t)) - sum(e, v(p,i,e,t)) + s(i,p,t);

 ESTOQUEINICIAL(i,p,t) $ (ord(t) = 1)..

         saldo(i,p,t) =e= sum(j, qe(p,j,i,t)) - sum(j, qs(p,i,j,t)) - sum(e, v(p,i,e,t)) + s(i,p,t) + IS(p,i);

 SEGURANCA(i,p,t)..

         saldo(i,p,t) =g= d(i,p);

 BALANCO(p,i,j,t)..

         qe(p,j,i,t) =e= qs(p,i,j,t+TFC(i,j,p));

model modelo1 / all /;

option MIP = cplex;

option optca=0;

solve modelo1 maximizing Z using MIP;

display qe.l, qs.l, v.l, saldo.l, s.l;


