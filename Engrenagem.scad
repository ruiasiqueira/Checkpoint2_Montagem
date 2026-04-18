// Parâmetros principais

num_lobes = 10;        // número de "dentes"/lóbulos

//10
outer_radius = 10;     // raio externo
//15
inner_radius = 13;     // raio base (define profundidade dos lóbulos)

thickness = 4;         // altura da peça

hole_radius = 4;       // raio do furo central

resolution = 200;      // suavidade

// Função que cria o perfil "ondulado"

function radial(r_base, r_amp, lobes, angle) =

    r_base + r_amp * sin(lobes * angle);

// Gera pontos do contorno

points = [

    for (i = [0 : resolution])

        let (

            angle = i * 360 / resolution,

            r = radial(inner_radius, outer_radius - inner_radius, num_lobes, angle)

        )

        [r * cos(angle), r * sin(angle)]

];

// Modelo 3D

difference() {

    linear_extrude(height = thickness)

        polygon(points);

    // Furo central

    translate([0,0,-1])

        cylinder(h = thickness + 2, r = hole_radius, $fn=100);

}
 