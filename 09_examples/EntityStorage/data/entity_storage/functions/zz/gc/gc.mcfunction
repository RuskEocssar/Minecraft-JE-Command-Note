#> entity_storage:zz/gc/gc
# スコアがない場合はガベージコレクトを実行
# @within
#   function entity_storage:zz/gc/schedule

## スケジュールの実行
    $schedule function entity_storage:zz/gc/schedule $(gc_duration)t

## スコアがないことを確認したらガベージコレクトを実行
    $execute if score $(name) estS.id matches 0.. run return 0
    
## ガベージをコレクト
    # idを保存
    data modify storage entity_storage:core unused_id append value 0
    execute store result storage entity_storage:core unused_id[-1] int 1 run scoreboard players get estH.gc estS.id
    # データをリセット
    $data modify storage entity_storage: data[$(id)] set value {}