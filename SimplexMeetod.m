format rat

kahe_faasiline_simplex_algoritm_public = @(t) kahe_faasiline_simplex_algoritm(t);
simplex_algoritm_public = @(t) simplex_algoritm(t);
lahenduskaik_format_public = @(t) lahenduskaik_format(t);

function lahenduskaik_format(lahendus)
fprintf("faas1:\n");
for i = 1:length(lahendus.faas1)
    fprintf('\n\n');
    disp(lahendus.faas1(i).tabel)
    if i < length(lahendus.faas1)
        fprintf(['juht veerg: x', int2str(lahendus.faas1(i+1).juht_veerg-1),', juht rea: b',int2str(lahendus.faas1(i+1).juht_rea-1),'\n']);
    end
end
fprintf('faas2:\n');
for i = 1:length(lahendus.faas2)
    fprintf('\n\n');
    disp(lahendus.faas2(i).tabel);
    if i < length(lahendus.faas2)
        fprintf(['juht veerg: x', int2str(lahendus.faas2(i+1).juht_veerg-1),', juht rea: b',int2str(lahendus.faas2(i+1).juht_rea-1),'\n']);
    end
end
valjenda_vastus(lahendus.faas2);
fprintf("lõpp\n");
end


function result = kahe_faasiline_simplex_algoritm(tabel)
format rat;
t1 = kf_simplex_algoritm_faas1(tabel);
t2 = kf_simplex_algoritm_faas2(t1(end).tabel, tabel);
result.faas1 = t1;
result.faas2 = t2;
valjenda_vastus(result.faas2);
end


function result = simplex_algoritm(tabel)
esialgne_tabel.tabel = tabel;
esialgne_tabel.juht_veerg = NaN;
esialgne_tabel.juht_rea = NaN;

uhikmaatriks = eye(height(tabel)-1);
uhikmaatriks = [zeros(1, width(uhikmaatriks)); uhikmaatriks];
tabel = [tabel, uhikmaatriks];

result.tabel = tabel;
result.juht_veerg = NaN;
result.juht_rea = NaN;
result = [esialgne_tabel result simplex_samm(tabel, ...
    @(v) koik_muutujad_on_mittenegatiivsed(v, 0.00000001), ...
    @(uus_tabel, vana_tabel) ~isequal(vana_tabel, uus_tabel) && ~(uus_tabel(1,1) < vana_tabel(1,1)))];
valjenda_vastus(result);
end


function valjenda_vastus(lanedus)
vx = votta_lahendused(lanedus(end).tabel);
lr = @(vr) leida_basivahelise_muutujate_rea(lanedus(end).tabel, vr);

v = zeros(1, length(vx));
for l = 1:length(vx)
    v(l) = lanedus(end).tabel(lr(vx(l)), 1);
end
vastusString = 'Vastus:';
for n = 1:length(vx)
    num = vx(n)-1;
    vastusString = [vastusString, ' x', int2str(num), '= ', rats(v(n))];
end
fprintf([vastusString, '\n']);
end


function result = kf_simplex_algoritm_faas1(tabel)
esialgne_tabel.tabel = tabel;
esialgne_tabel.juht_veerg = NaN;
esialgne_tabel.juht_rea = NaN;

maatriks = tabel(2:end, :);
aste = height(maatriks);
laius = width(maatriks);
faas1_tabel = [zeros(1, laius), ones(1, aste); maatriks, eye(aste)];
% lahutame sihifunktsiooni reas baasimuutujad:
for n = 1:aste
    faas1_tabel = vaheta_baasimuutujad(faas1_tabel, laius+n, n+1);
end
result.tabel = faas1_tabel;
result.juht_veerg = NaN;
result.juht_rea = NaN;
result = [esialgne_tabel result simplex_samm(faas1_tabel, ...
    @(v) v(1,1) > -0.0000001 && v(1,1) < 0.0000001, ...
    @(uus, vana) (uus(1, 1) < 0) && ~isequal(vana, uus) && ~(uus(1,1) < vana(1,1)))];
end


function result = kf_simplex_algoritm_faas2(faas1_lopptabel, tabel)
esialgne_tabel.tabel = faas1_lopptabel;
esialgne_tabel.juht_veerg = NaN;
esialgne_tabel.juht_rea = NaN;

tabel = [tabel(1, :); faas1_lopptabel(2:end, 1:width(tabel))];
bvm_veerud = leida_baasivahelise_muutujate_veerud(tabel);
for jv = bvm_veerud
    tabel = vaheta_baasimuutujad(tabel, jv, leida_basivahelise_muutujate_rea(tabel, jv));
end
result.tabel = tabel;
result.juht_veerg = NaN;
result.juht_rea = NaN;
result = [esialgne_tabel result simplex_samm(tabel, ...
    @(v) koik_muutujad_on_mittenegatiivsed(v, 0.00000001), ...
    @(uus_tabel, vana_tabel) ~isequal(vana_tabel, uus_tabel) && ~(uus_tabel(1,1) < vana_tabel(1,1)))];

end


function result = leida_baasivahelise_muutujate_veerud(tabel)
result = zeros(1,height(tabel)-1);
i = 1;
for n = 2:width(tabel)
    if sum(arrayfun(@(e) e == 0 || e==1,  tabel(2:end, n))) == size(tabel(2:end, n), 1) && sum(tabel(2:end,n))==1
        result(i) = n;
        i = i + 1;
    end
    if i > height(tabel)-1
        return
    end
end
result = result(1:i-1);
end


function result = votta_lahendused(tabel)
result = zeros(1,height(tabel)-1);
i = 1;
for n = 2:width(tabel)
    if sum(arrayfun(@(e) e == 0 || e==1, tabel(2:end, n))) == size(tabel(2:end, n), 1) && sum(tabel(1:end,n))==1
        result(i) = n;
        i = i + 1;
    end
    if i > height(tabel)-1
        return
    end
end
result = result(1:i-1);
end


function result = leida_basivahelise_muutujate_rea(tabel, veerg)
result = find(tabel(2:end,veerg) == 1) + 1;
end


function result = simplex_samm(tabel, valjastamise_tingimus, jatkamise_tingimus)
jv = optimaalsed_veerud(tabel);
result = [];
for n_jv = jv
    jr = optimaalne_rea(tabel, n_jv);
    for n_jr = jr
        v = vaheta_baasimuutujad(tabel, n_jv, n_jr);
        lahenduskaik.tabel = v;
        lahenduskaik.juht_veerg = n_jv;
        lahenduskaik.juht_rea = n_jr;
        if valjastamise_tingimus(v)
            result = lahenduskaik;
            return
        end
        if jatkamise_tingimus(v, tabel)
            jargmine = simplex_samm(v, valjastamise_tingimus, jatkamise_tingimus);
            if ~isempty(jargmine)
                result = [lahenduskaik jargmine];
                return
            end
        end
    end
end
end


function result = koik_muutujad_on_mittenegatiivsed(tabel, tapsus)
result = all(tabel(1,2:end) >= 0-tapsus);
end


function result = optimaalne_rea(tabel, juht_veerg)
result = [];
div = tabel(2:end, 1)./tabel(2:end, juht_veerg);
div = div(div > 0);
if ~isempty(div)
    result = find(tabel(2:end, 1)./tabel(2:end, juht_veerg) == min(div))' + 1;
end
end


function result = optimaalsed_veerud(tabel)
result = find(tabel(1,2:end) < 0)+1;
tt = tabel(1, result);
[~, ix] = sort(tt);
result = result(ix);
end


function result = vaheta_baasimuutujad(tabel, jv, jr)
% jv on juht veerg
% jr on juht rea
tabel = [tabel(1:jr - 1, :);
    tabel(jr, :) ./ tabel(jr, jv);
    tabel(jr+1:end, :)];
for i =  1:height(tabel)
    if i ~= jr
        tabel_ijv = tabel(i, jv);
        for j = 1:width(tabel)
            tabel(i, j) = tabel(i, j) - (tabel_ijv.*tabel(jr, j));
        end
    end
end
result = tabel;
end
