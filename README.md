# Fluxo do contrato

![image](https://user-images.githubusercontent.com/88160445/220696390-7eb62033-a096-4929-bc90-b6df36c65a45.png)


1- Habilita a função safeMint
2- Na função safeMint, são passados dois parâmetros: o endereço que receberá o NFT/SBT e uma URI/URL que ficará associada ao token
3- Ao ser criado, a id do token é autoincrementada

# Fluxo do processo de criação

1- Fazer upload do arquivo para algum provedor IPFS (exemplo: https://www.pinata.cloud/)
2- Pegar a URI do arquivo
3- Pegar o endereço da pessoa
4- Colocar o endereço e URI na função safeMint do contrato
5- Voilà!

# Notas

1- Tentei implementar regras extras que limitavam a funcionalidade do contrato (notas no código em si), mas não consegui
2- Burn é opcional
3- Com certerza deve ter um jeito de automatizar a criação do certificado, fazer upload em algum IFPS e associar direto (aí só dependeria da pessoa assinar)

