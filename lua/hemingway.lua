-- ###########################################################
-- # Maintainer: Mr. Charkuils                               #
-- # URL:        https://github.com/charkuils/nvim-hemingway #
-- ###########################################################

local util = require'hemingway.util'
local Logger = util.Logger

local M = {}

local comment_1  = { single = "// ", left = "/* ", right = " */" }
local comment_2  = { left = "<!-- ", right = " -->" }
local comment_3  = { single = "-- " }
local comment_4  = { single = "# " }
local comment_5  = { single = "; " }
local comment_6  = { single = "* " }
local comment_7  = { left = "{{!-- ", right = " --}}" }
local comment_8  = { single = "// " }
local comment_9  = { single = "' " }
local comment_10 = { single = "-- ", left = "{-- ", right = " --}" }
local comment_11 = { single = "% " }
local comment_12 = { single = "! " }
local comment_13 = { single = "// ", left = "(* ", right = " *)" }
local comment_14 = { single = "-- ", left = "{- ", right = " -}" }
local comment_15 = { left = "//- ", right = " //" }
local comment_16 = { single = "// ", left = "{/* ", right = " */}" }
local comment_17 = { left = "<%-- ", right = " --%>" }
local comment_18 = { single = "# ", left = "#= ", right = " =#" }
local comment_19 = { left = "{{-- ", right = " --}}" }
local comment_20 = { left = "/* ", right = " */" }
local comment_21 = { single = ">-- ", left = ">{- ", right = " -}" }
local comment_22 = { single = "; ", left = "#| ", right = " |#" }
local comment_23 = { single = "-- ", left = "--[[ ", right = " ]]" }
local comment_24 = { single = "% ", left = "%{ ", right = " %}" }
local comment_25 = { left = "(* ", right = " *)" }
local comment_26 = { single = "-- ", left = "/* ", right = " */" }
local comment_27 = { single = "% ", left = "/* ", right = " */" }
local comment_28 = { single = '" ' }
local comment_29 = { single = "' ", left = "/' ", right = " '/" }

M.comments = {
    actionscript    = comment_1,
    ada             = comment_3,
    awk             = comment_4,
    c               = comment_1,
    cabal           = comment_3,
    cafe            = comment_4,
    cfg             = comment_4,
    cg              = comment_1,
    ch              = comment_1,
    cl              = comment_4,
    clipper         = comment_1,
    clojure         = comment_5,
    cmake           = comment_4,
    conf            = comment_4,
    cpp             = comment_1,
    crontab         = comment_4,
    cs              = comment_1,
    css             = comment_20,
    csp             = comment_3,
    cterm           = comment_6,
    cucumber        = comment_4,
    cvs             = comment_6,
    cypher          = comment_8,
    d               = comment_1,
    desktop         = comment_4,
    dhcpd           = comment_4,
    diff            = comment_4,
    dns             = comment_5,
    dockerfile      = comment_4,
    dot             = comment_1,
    dsl             = comment_5,
    eiffel          = comment_3,
    elf             = comment_9,
    elixir          = comment_4,
    elm             = comment_10,
    elmfilt         = comment_4,
    erlang          = comment_11,
    fortran         = comment_12,
    fsharp          = comment_13,
    fstab           = comment_4,
    fx              = comment_1,
    gams            = comment_6,
    gdb             = comment_4,
    gitcommit       = comment_4,
    gitconfig       = comment_5,
    gitignore       = comment_4,
    gitrebase       = comment_4,
    glsl            = comment_1,
    go              = comment_1,
    groovy          = comment_1,
    h               = comment_1,
    haskell         = comment_14,
    haxe            = comment_1,
    hb              = comment_4,
    hbs             = comment_7,
    html            = comment_2,
    hyphy           = comment_1,
    icon            = comment_4,
    idl             = comment_1,
    idlang          = comment_5,
    idris           = comment_14,
    incar           = comment_12,
    inform          = comment_12,
    initlab         = comment_4,
    ishd            = comment_1,
    iss             = comment_5,
    jade            = comment_15,
    java            = comment_1,
    javascript      = comment_1,
    javascriptreact = comment_16,
    jess            = comment_5,
    jproperties     = comment_4,
    json5           = comment_1,
    jsonc           = comment_1,
    jsp             = comment_17,
    julia           = comment_18,
    kivy            = comment_4,
    kix             = comment_5,
    kotlin          = comment_1,
    kscript         = comment_1,
    laravel         = comment_19,
    ldif            = comment_4,
    less            = comment_20,
    lhaskell        = comment_21,
    lilo            = comment_4,
    lisp            = comment_22,
    llvm            = comment_5,
    lpc             = comment_1,
    lprolog         = comment_11,
    lscript         = comment_9,
    lss             = comment_4,
    lua             = comment_23,
    lynx            = comment_4,
    markdown        = comment_2,
    matlab          = comment_24,
    mel             = comment_1,
    meson           = comment_4,
    newlisp         = comment_5,
    nginx           = comment_4,
    nix             = comment_4,
    ocaml           = comment_25,
    occam           = comment_3,
    pascal          = comment_25,
    plantuml        = comment_29,
    pdf             = comment_11,
    perl            = comment_4,
    php             = comment_1,
    pike            = comment_1,
    pilrc           = comment_1,
    pine            = comment_4,
    plm             = comment_1,
    plsql           = comment_26,
    po              = comment_4,
    postsrc         = comment_11,
    pov             = comment_1,
    ppd             = comment_11,
    processing      = comment_1,
    prolog          = comment_27,
    proto           = comment_1,
    psf             = comment_4,
    puppet          = comment_4,
    python          = comment_4,
    r               = comment_4,
    racket          = comment_22,
    rc              = comment_1,
    rebol           = comment_5,
    registry        = comment_5,
    remind          = comment_4,
    robot           = comment_4,
    rspec           = comment_4,
    ruby            = comment_4,
    rust            = comment_1,
    sass            = comment_8,
    scala           = comment_1,
    scsh            = comment_5,
    scss            = comment_1,
    scheme          = comment_22,
    scilab          = comment_8,
    sed             = comment_4,
    sentinel        = comment_1,
    sgmllnx         = comment_2,
    sh              = comment_4,
    simula          = comment_11,
    skill           = comment_5,
    slice           = comment_1,
    sls             = comment_4,
    sm              = comment_4,
    sml             = comment_25,
    snippets        = comment_4,
    spec            = comment_4,
    sql             = comment_26,
    sqlforms        = comment_3,
    sqlj            = comment_3,
    ss              = comment_22,
    sshconfig       = comment_4,
    sshdconfig      = comment_4,
    swift           = comment_1,
    tags            = comment_5,
    tcl             = comment_4,
    tex             = comment_8,
    tf              = comment_4,
    tidy            = comment_4,
    tli             = comment_4,
    tmux            = comment_4,
    toml            = comment_4,
    tsscl           = comment_4,
    typescript      = comment_1,
    typescriptreact = comment_16,
    uc              = comment_1,
    vala            = comment_1,
    vb              = comment_9,
    vera            = comment_1,
    verilog         = comment_1,
    vhdl            = comment_3,
    vim             = comment_28,
    vimperator      = comment_28,
    wget            = comment_4,
    wikipedia       = comment_2,
    wml             = comment_4,
    xml             = comment_2,
    yaml            = comment_4,
    zig             = comment_8,
    zip             = comment_8,
    zsh             = comment_4
}

local function is_valid_comment(comment)
    local size = util.table_length(comment)

    if size == 1 and comment.single and util.is_string(comment.single) then
        return true
    end

    if size == 2 and comment.left and comment.right and util.is_string(comment.left)
        and util.is_string(comment.right)
    then
        return true
    end

    if size == 3 and comment.single and comment.left and comment.right and
        util.is_string(comment.single) and util.is_string(comment.left) and util.is_string(comment.righ) then
        return true
    end
    return false
end

local function is_valid_language(language)
    for k, v in pairs(language) do
        if M.comments[k] then
            Logger:warn("Language " .. k .. " already exists in nvim-hemingway!")
            return false
        else
            if not is_valid_comment(v) then
                Logger:warn("Language " .. k .. " has error format!")
                return false
            end
        end
    end
    return true
end

function M.add_comments(new_comments)
    local is_language_valid = is_valid_language(new_comments)
    if util.table_length(new_comments) > 0 and is_language_valid then
        table.insert(M.comments, new_comments)
    end
end

return M
