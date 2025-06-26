; ModuleID = 'svp_simple_511_001.bc'
source_filename = "./svp_simple_511_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myglobal = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_511_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !10
  %3 = call i32 (...) @lock(), !dbg !14
  %4 = load i32, i32* @myglobal, align 4, !dbg !15, !tbaa !16
  %5 = add nsw i32 %4, 1, !dbg !15
  store i32 %5, i32* @myglobal, align 4, !dbg !15, !tbaa !16
  %6 = call i32 (...) @unlock(), !dbg !18
  ret void, !dbg !19
}

declare i32 @lock(...) #1

declare i32 @unlock(...) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_511_001_main() #0 !dbg !20 {
  %1 = call i32 (...) @lock(), !dbg !21
  %2 = load i32, i32* @myglobal, align 4, !dbg !22, !tbaa !16
  %3 = add nsw i32 %2, 1, !dbg !22
  store i32 %3, i32* @myglobal, align 4, !dbg !22, !tbaa !16
  %4 = call i32 (...) @unlock(), !dbg !23
  ret i32 0, !dbg !24
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
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 7, column: 3, scope: !7)
!15 = !DILocation(line: 8, column: 11, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !12, i64 0}
!18 = !DILocation(line: 9, column: 3, scope: !7)
!19 = !DILocation(line: 11, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: "svp_simple_511_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 17, column: 3, scope: !20)
!22 = !DILocation(line: 18, column: 11, scope: !20)
!23 = !DILocation(line: 19, column: 3, scope: !20)
!24 = !DILocation(line: 21, column: 3, scope: !20)
