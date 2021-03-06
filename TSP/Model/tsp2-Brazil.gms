$title Traveling Salesman Problem - Two (TSP2,SEQ=178)

$onText
This is the second problem in a series of traveling salesman
problems. The formulation in this model uses subtour elimination
constraints of the form

   u(i) - u(j) + n*x(i,j) <= n - 1

Additional information can be found at:

http://www.gams.com/modlib/adddocs/tsp2doc.htm


Kalvelagen, E, Model Building with GAMS. forthcoming

de Wetering, A V, private communication.

Keywords: mixed integer linear programming, traveling salesman problem, Miller-
          Tucker-Zemlin subtour elimination
$offText

$eolCom //


* TSP data and incomplete TSP model. The data is problem br17 from TSPLIB.
* (http://www.iwr.uni-heidelberg.de/iwr/comopt/soft/TSPLIB95/TSPLIB.html)

set ii    cities / i1*i26 /
    i(ii) subset of cities
alias (ii,jj),(i,j,k);

table c(ii,jj) cost coefficients (br17 from TSPLIB)
                i1             i2             i3             i4             i5             i6             i7             i8             i9            i10            i11            i12            i13            i14            i15            i16            i17            i18            i19            i20            i21            i22            i23            i24            i25            i26
 i1              0         434394         591068        1135135        2696840        3089984        2027872         414738        2903398         898426        3873378         943063        2479781        2989651        2994916         695461        2821456        2652282        1525607         992362        2222865        2667276        2985865        2708559        1812075        4621177
 i2         432204              0         441388        1568370        2300806        2586958        1631839         847974        3203717        1297651        4272603         522467        2083748        2593617        2930901        1128697        2425423        2588267        1924832        1416651        1826831        2690286        3385090        2984087        1985219        5020402
 i3         585937         440984              0        1721955        2136626        2422778        1467659        1001558        2772567         874594        3920763         522914        1919568        2429437        2499751        1282281        2261243        2157117        1572993        1263266        1662651        2351045        3033251        2790495        1554069        4668563
 i4        1142980        1568952        1725626              0        3831398        4197532        3162430         746179        4010947        2005975        4475083        2077621        3614339        4124208        4102465         456359        3956014        3759830        2127312        1425252        3357423        3346165        3587570        2820369        2919623        5222882
 i5        2640150        2301090        2084925        3776169              0         758591         806870        3055772        2025438        2314386        4673457        1842373         259029         288291        1553531        3336495         120096        1120608        3173456        3153700         501161        2003187        4181848        3617166        2039349        5421256
 i6        3101778        2587805        2371641        4209880         781506              0        1188705        3489484        1497455        2320033        4193252        2156986         950887         538655         900139        3770206         682287         592973        3179103        3159347        1108537        1448515        3701643        3298010        1763796        4941051
 i7        1971445        1632385        1416220        3107464         804914        1186218              0        2387067        2048363        1645681        4852521        1167033         581335        1091204        1576457        2667790         923009        1143534        2504751        2484995         314681        2003289        3965009        3211741        1438016        5600321
 i8         423669         849641        1006315         743889        3112087        3478221        2443119              0        3291636        1286664        4021268        1358310        2895028        3404897        3383154         304215        3236703        3040519        1673497        1003334        2638112        2837232        3133755        2599207        2200312        4769067
 i9        2883768        3121061        2693666        3991870        2025474        1499342        2050655        3271473              0        1982492        3047194        3188012        2104458        1974222         581827        3552196        2067919         906970        2490069        2846630        2017703         330014        2555585        2336792        1221601        3794993
i10         903126        1304979         891890        2011228        2314899        2319384        1645931        1290831        1981337              0        3242942        1405760        2097840        2607710        2007656        1571554        2439515        1881682         895171         841449        1840924        1873284        2355429        2136767         822544        3990741
i11        3875768        4277622        3949684        4480368        4674151        4194959        4855394        4023407        3049515        3245753              0        4463554        4753135        4734076        3538568        4320891        4716596        3602587        2347758        3054826        4666380        1054285         888329        1151251        3414055         748466
i12         942622         524755         521933        2078788        1842155        2161260        1167064        1358392        3187649        1390564        4436734              0        1618575        2128444        2551499        1639114        1960250        2118576        2088963        1927069        1361659        2545496        3549221        3156358        2068850        5184533
i13        2423425        2084364        1868200        3559443         259978         950866         583009        2839046        2100808        2097660        4748828        1618512              0         546268        1628902        3119769         378073        1195979        2956730        2936975         277300        2007291        4416988        3513996        1889996        5496627
i14        2925467        2586407        2370242        4061486         288028         529015        1091544        3341089        1958039        2599703        4725509        2127046         543702              0        1426813        3621812         188808        1053556        3458773        3439017         785835        1870842        4233900        3615831        2091400        5473308
i15        2907984        2924415        2497021        4016086        1551509         898023        1576690        3295690         580575        2006709        3536391        2544971        1630493        1429568              0        3576412        1573201         433005        2684372        2870846        1543738         805866        3044783        2728920        1245818        4284191
i16         704635        1130606        1287281         458725        3393052        3759187        2724084         307834        3572602        1567629        4320354        1639275        3175994        3685863        3664119              0        3517668        3321485        1972584        1302421        2919077        3083248        3432842        2812968        2481278        5068154
i17        2759042        2419982        2203817        3895061         121602         659578         925118        3174664        2070056        2433278        4718076        1960621         377277         189277        1557376        3455387              0        1165227        3292348        3272592         619409        1962028        4226467        3634039        2083968        5465875
i18        2664383        2584616        2157221        3772485        1121135         592806        1146316        3052088         905969        1882638        3601766        2114596        1200119        1067687         434063        3332811        1163580              0        2575479        2721952        1113364        1081334        3110157        2810436        1136924        4349565
i19        1527495        1929349        1601411        2132094        3176089        3180574        2507121        1675134        2344334         897479        2347922        2115281        2959030        3468900        2688580        1972617        3300705        2578456              0         706553        2702114        1821475        1460409        1414802        1503468        3095721
i20         992385        1418356        1270170        1427443        3158260        3162746        2489293        1002002        2852561         844137        3056331        1927026        2941202        3451071        2878880        1299486        3282877        2725044         708561              0        2684286        2311146        2168819        1831551        1693768        3804131
i21        2167023        1827963        1611798        3303042         499793        1107113         317061        2582645        2017585        1841259        4665604        1362110         276213         786083        1545679        2863368         617888        1112756        2700329        2680573              0        1962274        4160587        3356323        1633594        5413404
i22        2667276        2690286        2351045        3346165        2003187        1448515        2003289        2837232         330014        1873284        1054285        2545496        2007291        1870842         805866        3083248        1962028        1081334        1821475        2311146        1962274              0        1726674        2161732        1182577        1113063
i23        2988242        3390096        3062158        3592842        4181612        3702420        3967868        3135881        2556976        2358226         887613        3576028        4419778        4241536        3046029        3433364        4224057        3110047        1460232        2167300        4162861        1726674              0         448895        2964215        1635413
i24        2708559        2984087        2790495        2820369        3617166        3298010        3211741        2599207        2336792        2136767        1151251        3156358        3513996        3615831        2728920        2812968        3634039        2810436        1414802        1831551        3356323        2161732         448895              0        2136580        1626697
i25        1724465        1972263        1544869        2832567        2041669        1765602        1448296        2112170        1223587         823189        3393866        2058738        1900205        2101593        1249905        2392893        2084113        1139781        1500853        1687326        1643289        1182577        2961111        2136580              0        4141665
i26        4626711        5028564        4700627        5231310        5425093        4945901        5606337        4774349        3800457        3996695         749144        5214496        5504077        5485018        4289511        5071833        5467538        4353529        3098700        3805768        5417322        1113063        1639271        1626697        4164997              0;

*
* for computational work with simple minded
* algorithm we can restrict size of problem
* and define the model over a subset of all cities.
*
*
variables x(ii,jj)  decision variables - leg of trip
          z         objective variable;
binary variable x;

equations objective   total cost
          rowsum(ii)  leave each city only once
          colsum(jj)  arrive at each city only once;
*
*
* the assignment problem is a relaxation of the TSP
*
objective.. z =e= sum((i,j), c(i,j)*x(i,j));

rowsum(i).. sum(j, x(i,j)) =e= 1;
colsum(j).. sum(i, x(i,j)) =e= 1;

* exclude diagonal
*
x.fx(ii,ii) = 0;

Set ij(ii,jj) 'exclude first row and column';
ij(ii,jj) = ord(ii) > 1 and ord(jj) > 1;

Variable u(ii)     'subtour elimination strategy 3';

Equation se(ii,jj) 'subtour elimination constraints';

se(ij(i,j)).. u(i) - u(j) + card(i)*x(i,j) =l= card(i) - 1;

Model tsp / objective, rowsum, colsum, se /;

* Try a small problem first - first six cities
i(ii) = ord(ii) <= 26;

option optCr = 0.05;

solve tsp min z using mip;

display x.l;

* Try a bit larger problem - 10 cities
i(ii) = ord(ii) <= 26;

option limCol = 0, limRow = 0;

solve tsp min z using mip;

display x.l;

file sol /Sol_TSP.txt/;
put sol;
             put 'Solucao do TSP';
put /;
loop((ii,jj),
         if (x.l(ii,jj)>0.5,
             put ii.tl jj.tl x.l(ii,jj)/;););
