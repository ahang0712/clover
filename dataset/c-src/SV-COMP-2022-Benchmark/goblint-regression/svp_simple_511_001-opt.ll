; ModuleID = 'svp_simple_511_001-opt.bc'
source_filename = "./svp_simple_511_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myglobal = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_511_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = call i32 (...) @lock(), !dbg !10
  %3 = load i32, i32* @myglobal, align 4, !dbg !11, !tbaa !12
  %4 = add nsw i32 %3, 1, !dbg !11
  store i32 %4, i32* @myglobal, align 4, !dbg !11, !tbaa !12
  %5 = call i32 (...) @unlock(), !dbg !16
  ret void, !dbg !17
}

declare i32 @lock(...) #1

declare i32 @unlock(...) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_511_001_main() #0 !dbg !18 {
  %1 = call i32 (...) @lock(), !dbg !19
  %2 = load i32, i32* @myglobal, align 4, !dbg !20, !tbaa !12
  %3 = add nsw i32 %2, 1, !dbg !20
  store i32 %3, i32* @myglobal, align 4, !dbg !20, !tbaa !12
  %4 = call i32 (...) @unlock(), !dbg !21
  ret i32 0, !dbg !22
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_511_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_511_001_isr_1", scope: !8, file: !8, line: 6, type: !9, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_511_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 7, column: 3, scope: !7)
!11 = !DILocation(line: 8, column: 11, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 9, column: 3, scope: !7)
!17 = !DILocation(line: 11, column: 1, scope: !7)
!18 = distinct !DISubprogram(name: "svp_simple_511_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!19 = !DILocation(line: 17, column: 3, scope: !18)
!20 = !DILocation(line: 18, column: 11, scope: !18)
!21 = !DILocation(line: 19, column: 3, scope: !18)
!22 = !DILocation(line: 21, column: 3, scope: !18)
