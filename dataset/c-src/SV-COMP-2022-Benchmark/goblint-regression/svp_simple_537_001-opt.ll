; ModuleID = 'svp_simple_537_001-opt.bc'
source_filename = "./svp_simple_537_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g1 = common global i32 0, align 4
@g2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_537_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = load i32, i32* @g1, align 4, !dbg !10, !tbaa !11
  %3 = add nsw i32 %2, 1, !dbg !15
  store i32 %3, i32* @g1, align 4, !dbg !16, !tbaa !11
  %4 = load i32, i32* @g2, align 4, !dbg !17, !tbaa !11
  %5 = add nsw i32 %4, 1, !dbg !18
  store i32 %5, i32* @g2, align 4, !dbg !19, !tbaa !11
  ret void, !dbg !20
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_537_001_main() #0 !dbg !21 {
  %1 = load i32, i32* @g2, align 4, !dbg !22, !tbaa !11
  %2 = add nsw i32 %1, 1, !dbg !23
  store i32 %2, i32* @g1, align 4, !dbg !24, !tbaa !11
  ret i32 0, !dbg !25
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_537_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_537_001_isr_1", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_537_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 4, column: 14, scope: !7)
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !DILocation(line: 4, column: 16, scope: !7)
!16 = !DILocation(line: 5, column: 6, scope: !7)
!17 = !DILocation(line: 8, column: 14, scope: !7)
!18 = !DILocation(line: 8, column: 16, scope: !7)
!19 = !DILocation(line: 9, column: 6, scope: !7)
!20 = !DILocation(line: 12, column: 1, scope: !7)
!21 = distinct !DISubprogram(name: "svp_simple_537_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!22 = !DILocation(line: 16, column: 6, scope: !21)
!23 = !DILocation(line: 16, column: 8, scope: !21)
!24 = !DILocation(line: 16, column: 5, scope: !21)
!25 = !DILocation(line: 18, column: 3, scope: !21)
