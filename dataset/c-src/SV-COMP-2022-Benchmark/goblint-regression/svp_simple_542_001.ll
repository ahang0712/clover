; ModuleID = 'svp_simple_542_001.bc'
source_filename = "./svp_simple_542_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@myglobal = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @f(i32 %0) #0 !dbg !7 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !10
  ret i32 5, !dbg !14
}

; Function Attrs: nounwind uwtable
define void @svp_simple_542_001_isr_1(i8* %0) #0 !dbg !15 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !16
  %4 = load i32, i32* @myglobal, align 4, !dbg !18, !tbaa !10
  %5 = call i32 @f(i32 %4), !dbg !19
  store i32 %5, i32* @myglobal, align 4, !dbg !20, !tbaa !10
  %6 = load i32, i32* @myglobal, align 4, !dbg !21, !tbaa !10
  %7 = icmp eq i32 %6, 5, !dbg !22
  br i1 %7, label %8, label %11, !dbg !21

8:                                                ; preds = %1
  %9 = bitcast i32* %3 to i8*, !dbg !23
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #2, !dbg !23
  store i32 1, i32* %3, align 4, !dbg !24, !tbaa !10
  %10 = bitcast i32* %3 to i8*, !dbg !25
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #2, !dbg !25
  br label %11, !dbg !25

11:                                               ; preds = %8, %1
  ret void, !dbg !26
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_542_001_main() #0 !dbg !27 {
  %1 = load i32, i32* @myglobal, align 4, !dbg !28, !tbaa !10
  %2 = call i32 @f(i32 %1), !dbg !29
  store i32 %2, i32* @myglobal, align 4, !dbg !30, !tbaa !10
  %3 = load i32, i32* @myglobal, align 4, !dbg !31, !tbaa !10
  %4 = call i32 @f(i32 %3), !dbg !32
  store i32 %4, i32* @myglobal, align 4, !dbg !33, !tbaa !10
  ret i32 0, !dbg !34
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind }

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
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 5, column: 3, scope: !7)
!15 = distinct !DISubprogram(name: "svp_simple_542_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!16 = !{!17, !17, i64 0}
!17 = !{!"any pointer", !12, i64 0}
!18 = !DILocation(line: 8, column: 16, scope: !15)
!19 = !DILocation(line: 8, column: 14, scope: !15)
!20 = !DILocation(line: 8, column: 13, scope: !15)
!21 = !DILocation(line: 9, column: 8, scope: !15)
!22 = !DILocation(line: 9, column: 17, scope: !15)
!23 = !DILocation(line: 10, column: 11, scope: !15)
!24 = !DILocation(line: 10, column: 15, scope: !15)
!25 = !DILocation(line: 11, column: 5, scope: !15)
!26 = !DILocation(line: 12, column: 1, scope: !15)
!27 = distinct !DISubprogram(name: "svp_simple_542_001_main", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = !DILocation(line: 18, column: 16, scope: !27)
!29 = !DILocation(line: 18, column: 14, scope: !27)
!30 = !DILocation(line: 18, column: 12, scope: !27)
!31 = !DILocation(line: 19, column: 16, scope: !27)
!32 = !DILocation(line: 19, column: 14, scope: !27)
!33 = !DILocation(line: 19, column: 12, scope: !27)
!34 = !DILocation(line: 20, column: 3, scope: !27)
