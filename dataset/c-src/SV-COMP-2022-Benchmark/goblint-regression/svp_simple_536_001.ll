; ModuleID = 'svp_simple_536_001.bc'
source_filename = "./svp_simple_536_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data1 = internal global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@data2 = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_536_001_isr_1(i8* %0) #0 !dbg !7 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !10
  %4 = bitcast i32* %3 to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !14
  %5 = load i32, i32* @data1, align 4, !dbg !15, !tbaa !16
  %6 = add nsw i32 %5, 1, !dbg !18
  store i32 %6, i32* %3, align 4, !dbg !19, !tbaa !16
  %7 = load i32, i32* %3, align 4, !dbg !20, !tbaa !16
  store i32 %7, i32* @data1, align 4, !dbg !21, !tbaa !16
  %8 = load i32, i32* @data2, align 4, !dbg !22, !tbaa !16
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32 %8), !dbg !23
  %10 = bitcast i32* %3 to i8*, !dbg !24
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #3, !dbg !24
  ret void, !dbg !24
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_536_001_main() #0 !dbg !25 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @data1, align 4, !dbg !26, !tbaa !16
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32 %2), !dbg !27
  %4 = bitcast i32* %1 to i8*, !dbg !28
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !28
  %5 = load i32, i32* @data2, align 4, !dbg !29, !tbaa !16
  %6 = add nsw i32 %5, 1, !dbg !30
  store i32 %6, i32* %1, align 4, !dbg !31, !tbaa !16
  %7 = load i32, i32* %1, align 4, !dbg !32, !tbaa !16
  store i32 %7, i32* @data2, align 4, !dbg !33, !tbaa !16
  %8 = bitcast i32* %1 to i8*, !dbg !34
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #3, !dbg !34
  ret i32 0, !dbg !35
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_536_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_536_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_536_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !{!11, !11, i64 0}
!11 = !{!"any pointer", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = !DILocation(line: 8, column: 3, scope: !7)
!15 = !DILocation(line: 8, column: 14, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !12, i64 0}
!18 = !DILocation(line: 8, column: 19, scope: !7)
!19 = !DILocation(line: 8, column: 7, scope: !7)
!20 = !DILocation(line: 9, column: 11, scope: !7)
!21 = !DILocation(line: 9, column: 9, scope: !7)
!22 = !DILocation(line: 12, column: 15, scope: !7)
!23 = !DILocation(line: 12, column: 3, scope: !7)
!24 = !DILocation(line: 13, column: 1, scope: !7)
!25 = distinct !DISubprogram(name: "svp_simple_536_001_main", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!26 = !DILocation(line: 17, column: 15, scope: !25)
!27 = !DILocation(line: 17, column: 3, scope: !25)
!28 = !DILocation(line: 18, column: 3, scope: !25)
!29 = !DILocation(line: 18, column: 13, scope: !25)
!30 = !DILocation(line: 18, column: 18, scope: !25)
!31 = !DILocation(line: 18, column: 7, scope: !25)
!32 = !DILocation(line: 19, column: 11, scope: !25)
!33 = !DILocation(line: 19, column: 9, scope: !25)
!34 = !DILocation(line: 23, column: 1, scope: !25)
!35 = !DILocation(line: 22, column: 3, scope: !25)
