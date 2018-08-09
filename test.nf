Channel.from( ['Sample1','Sample2','Sample3','Sample4'] ).into { samples; samples2 }

samples2.subscribe { println "samples2: ${it}" }

process make_file {
    tag "${sampleID}"
    publishDir "${params.outputDir}/make_file", mode: 'copy', overwrite: true
    echo true
    executor "local"


    input:
    val(sampleID) from samples

    output:
    file "${sampleID}.txt" into samples_files, samples_files2, samples_files3
    set val(sampleID), file("${sampleID}.txt") into samples_files4

    script:
    """
    echo "[make_file]: ${sampleID}"
    echo "[make_file]: ${sampleID}" > "${sampleID}.txt"
    """
}

samples_files2.subscribe { println "[samples_files2]: ${it}" }
samples_files3.collectFile(name: "samples_files3.txt", storeDir: "${params.outputDir}")

process get_files {
    tag "${sampleID}"
    echo true
    executor "local"

    input:
    set val(sampleID), file(samples_file) from samples_files4

    script:
    """
    echo "[get_files] sampleID: ${sampleID}, samples_file: ${samples_file}"
    """
}

process get_all_files {
    echo true
    executor "local"

    input:
    file(samples_files: "*") from samples_files.collect()

    script:
    """
    printf "[get_all_files] %s" "${samples_files}"
    """
}
