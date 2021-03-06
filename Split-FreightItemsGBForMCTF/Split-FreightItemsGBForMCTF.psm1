using namespace System.Collections.Generic
function Split-FreightItemsGBForMCTF($FreightItems,$FreightTR){
    if ($FreightTR.count -eq 0){
        $FreightItems,@()
    }else{
        $b_fgt_numbers = [HashSet[string]]::new([string[]]($FreightTR.fgt_number))
        $v = $FreightItems | Group-Object {$b_fgt_numbers.Contains($_.fgt_number)} -AsHashTable -AsString
        $FreightItemsG = $v.False
        $FreightItemsB = $v.True
        if($null -eq $FreightItemsG){$FreightItemsG = @()}
        if($null -eq $FreightItemsB){$FreightItemsB = @()}
        $FreightItemsG,$FreightItemsB
    }
}
Export-ModuleMember -Function * -Alias *