; ModuleID = 'svp_simple_542_001-opt.bc'
source_filename = "./svp_simple_542_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myglobal = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @f(i32 %0) #0 !dbg !7 {
  ret i32 5, !dbg !10
}

; Function Attrs: nounwind uwtable
define void @svp_simple_542_001_isr_1(i8* %0) #0 !dbg !11 {
  %2 = load i32, i32* @myglobal, align 4, !dbg !12, !tbaa !13
  store i32 5, i32* @myglobal, align 4, !dbg !17, !tbaa !13
  %3 = load i32, i32* @myglobal, align 4, !dbg !18, !tbaa !13
  %4 = icmp eq i32 %3, 5, !dbg !19
  br i1 %4, label %5, label %6, !dbg !18

5:                                                ; preds = %1
  br label %6, !dbg !20

6:                                                ; preds = %5, %1
  ret void, !dbg !21
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_542_001_main() #0 !dbg !22 {
  %1 = load i32, i32* @myglobal, align 4, !dbg !23, !tbaa !13
  store i32 5, i32* @myglobal, align 4, !dbg !24, !tbaa !13
  %2 = load i32, i32* @myglobal, align 4, !dbg !25, !tbaa !13
  store i32 5, i32* @myglobal, align 4, !dbg !26, !tbaa !13
  ret i32 0, !dbg !27
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_542_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "f", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_542_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 5, column: 3, scope: !7)
!11 = distinct !DISubprogram(name: "svp_simple_542_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!12 = !DILocation(line: 8, column: 16, scope: !11)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 8, column: 13, scope: !11)
!18 = !DILocation(line: 9, column: 8, scope: !11)
!19 = !DILocation(line: 9, column: 17, scope: !11)
!20 = !DILocation(line: 11, column: 5, scope: !11)
!21 = !DILocation(line: 12, column: 1, scope: !11)
!22 = distinct !DISubprogram(name: "svp_simple_542_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 18, column: 16, scope: !22)
!24 = !DILocation(line: 18, column: 12, scope: !22)
!25 = !DILocation(line: 19, column: 16, scope: !22)
!26 = !DILocation(line: 19, column: 12, scope: !22)
!27 = !DILocation(line: 20, column: 3, scope: !22)
